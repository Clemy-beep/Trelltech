import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'auth_service.dart';
import 'boards_services.dart';

class TrelloLists with ChangeNotifier, DiagnosticableTreeMixin {
  final Auth _auth;
  final Boards _boards;

  List<TrelloList> lists = [];
  Map<String, TrelloList> listsById = {};
  Map<String, List<TrelloList>> listsByBoardId = {};

  TrelloLists(this._auth, this._boards) {
    update();
  }

  update() async {
    if (_auth.apiToken == null) {
      return;
    }

    log(_auth.apiToken ?? '');

    //get list of all boards
    var requests = <Future>[];
    for (var board in _boards.boards) {
      log(_boards.boards[0].id);
      requests.add(http.get(
        Uri.parse("https://api.trello.com/1/boards/${board.id}/lists"),
        headers: {
          'Authorization':
              'OAuth oauth_consumer_key="${Auth.apiKey}", oauth_token="${_auth.apiToken}"',
        },
      ).then((response) {
        if (response.statusCode >= 400) {
          log(response.body);
          throw Exception(response.body);
        }

        final responseJson = jsonDecode(response.body) as List<dynamic>;

        //check if need update, create, delete
        for (var list in responseJson) {
          _updateData(list, board);
        }

        //delete list that are not in response
        for (var list in lists) {
          if (responseJson.indexWhere((element) => element['id'] == list.id) ==
              -1) {
            lists.remove(list);
            listsById.remove(list.id);
          }
        }
      }));
    }

    await Future.wait(requests).then((value) => log('done'));
    notifyListeners();
  }

  _updateData(Map<String, dynamic> list, Board board) {
    log(list.toString());
    final index = listsById.keys.toList().indexOf(list['id']);
    if (index == -1) {
      TrelloList tmpList = TrelloList.fromJson(list, _auth, this);
      lists.add(tmpList);
      listsById[list['id']] = tmpList;
      if (listsByBoardId[board.id] == null) {
        listsByBoardId[board.id] = [tmpList];
      } else {
        //place in list by pos from other list
        int pos = tmpList.pos;
        List<TrelloList> tmpListList = listsByBoardId[board.id]!;
        for (int i = 0; i < tmpListList.length; i++) {
          if (tmpListList[i].pos > pos) {
            tmpListList.insert(i, tmpList);
            log('insert list in listByBoardId');
            break;
          }
        }
        //if not inserted, add to end
        if (!tmpListList.contains(tmpList)) {
          tmpListList.add(tmpList);
        }
      }
    } else {
      //update position if needed
      if (listsById[list['id']]?.pos != list['pos']) {
        listsByBoardId[board.id]!.remove(listsById[list['id']]);
        listsById[list['id']]!.updateData(list);
        int pos = list['pos'];
        List<TrelloList> tmpListList = listsByBoardId[board.id]!;
        for (int i = 0; i < tmpListList.length; i++) {
          if (tmpListList[i].pos > pos) {
            tmpListList.insert(i, listsById[list['id']]!);
            log('insert list in listByBoardId');
            break;
          }
        }
        //if not inserted, add to end
        if (!tmpListList.contains(listsById[list['id']])) {
          tmpListList.add(listsById[list['id']]!);
        }
      } else {
        listsById[list['id']]!.updateData(list);
      }
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('lists', lists));
    properties.add(IterableProperty('listsById', listsById.values));
    properties.add(IterableProperty('listsByBoardId', listsByBoardId.values));
  }

  //{{protocol}}://{{host}}/{{basePath}}lists?name={{name}}&idBoard={{idBoard}}
  create({
    required String name,
    required String idBoard,
    String? idListSource,
    double? pos,
  }) async {
    if (_auth.apiToken == null) {
      return;
    }

    Map<String, dynamic> queryParameters = {
      'name': name,
      'idBoard': idBoard,
      if (idListSource != null) 'idListSource': idListSource,
      if (pos != null) 'pos': pos,
    };

    var response = await http.post(
      Uri.https('api.trello.com', '/1/lists', queryParameters),
      headers: {
        'Authorization':
            'OAuth oauth_consumer_key="${Auth.apiKey}", oauth_token="${_auth.apiToken}"',
      },
    );

    if (response.statusCode >= 400) {
      log(response.body);
      throw Exception(response.body);
    }

    final responseJson = jsonDecode(response.body);
    _updateData(responseJson, _boards.boardsById[idBoard]!);

    notifyListeners();
  }
}

class TrelloList with ChangeNotifier, DiagnosticableTreeMixin {
  final Auth _auth;
  final TrelloLists _trelloLists;

  final String id;
  String name;
  bool closed;
  String? color;
  String idBoard;
  int pos;
  bool subscribed;
  int? softLimit;

  TrelloList({
    required this.id,
    required this.name,
    required this.closed,
    this.color,
    required this.idBoard,
    required this.pos,
    required this.subscribed,
    this.softLimit,
    required Auth auth,
    required TrelloLists trelloLists,
  })  : _auth = auth,
        _trelloLists = trelloLists;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('id', id));
    properties.add(DiagnosticsProperty('name', name));
    properties.add(DiagnosticsProperty('closed', closed));
    properties.add(DiagnosticsProperty('color', color));
    properties.add(DiagnosticsProperty('idBoard', idBoard));
    properties.add(DiagnosticsProperty('pos', pos));
    properties.add(DiagnosticsProperty('subscribed', subscribed));
    properties.add(DiagnosticsProperty('softLimit', softLimit));
  }

  factory TrelloList.fromJson(
      Map<String, dynamic> json, Auth auth, TrelloLists trelloLists) {
    return TrelloList(
      id: json['id'],
      name: json['name'],
      closed: json['closed'],
      color: json['color'],
      idBoard: json['idBoard'],
      pos: json['pos'] ?? 0,
      subscribed: json['subscribed'],
      softLimit: json['softLimit'],
      auth: auth,
      trelloLists: trelloLists,
    );
  }

  updateData(Map<String, dynamic> json) {
    bool update = false;

    if (name != json['name']) {
      name = json['name'];
      update = true;
    }
    if (closed != json['closed']) {
      closed = json['closed'];
      update = true;
    }
    if (color != json['color']) {
      color = json['color'];
      update = true;
    }
    if (idBoard != json['idBoard']) {
      idBoard = json['idBoard'];
      update = true;
    }
    if (pos != json['pos']) {
      pos = json['pos'];
      update = true;
    }
    if (subscribed != json['subscribed']) {
      subscribed = json['subscribed'];
      update = true;
    }
    if (softLimit != json['softLimit']) {
      softLimit = json['softLimit'];
      update = true;
    }

    if (update) {
      notifyListeners();
    }
  }

  update({
    String? name,
    String? closed,
    String? idBoard,
    double? pos,
    String? subscribed,
  }) async {
    if (_auth.apiToken == null) {
      return;
    }

    Map<String, dynamic> queryParameters = {
      if (name != null) 'name': name,
      if (closed != null) 'closed': closed,
      if (idBoard != null) 'idBoard': idBoard,
      if (pos != null) 'pos': pos,
      if (subscribed != null) 'subscribed': subscribed,
    };

    var response = await http.put(
      Uri.https('api.trello.com', '/1/lists/$id', queryParameters),
      headers: {
        'Authorization':
            'OAuth oauth_consumer_key="${Auth.apiKey}", oauth_token="${_auth.apiToken}"',
      },
    );

    if (response.statusCode >= 400) {
      log(response.body);
      throw Exception(response.body);
    }

    final responseJson = jsonDecode(response.body);
    updateData(responseJson);

    notifyListeners();
    _trelloLists.update();
  }

  delete() async {
    if (_auth.apiToken == null) {
      return;
    }

    var response = await http.delete(
      Uri.https('api.trello.com', '/1/lists/$id'),
      headers: {
        'Authorization':
            'OAuth oauth_consumer_key="${Auth.apiKey}", oauth_token="${_auth.apiToken}"',
      },
    );

    if (response.statusCode >= 400) {
      log(response.body);
      throw Exception(response.body);
    }

    _trelloLists.lists.remove(this);
    _trelloLists.listsById.remove(id);
    _trelloLists.listsByBoardId[idBoard]?.remove(this);

    notifyListeners();

    _trelloLists.update();
  }
}
