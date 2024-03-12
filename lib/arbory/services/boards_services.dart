//list of board with provider

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'user_info_service.dart';
import 'auth_service.dart';

class Boards with ChangeNotifier, DiagnosticableTreeMixin {
  final Auth _auth;
  final TokenMember _tokenMember;
  List<Board> boards = [];
  Map<String, Board> boardsById = {};
  Map<String, List<Board>> boardsByOrganizationId = {};

  Boards(this._tokenMember, this._auth) {
    update();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('boards', boards));
    properties.add(IterableProperty('boardsById', boardsById.values));
    properties.add(IterableProperty(
        'boardsByOrganizationId', boardsByOrganizationId.values));
  }

  update() async {
    if (_auth.apiToken == null) {
      return;
    }
    if (_tokenMember.member == null) {
      return;
    }

    final response = await http.get(
        Uri.parse(
            "https://api.trello.com/1/members/${_tokenMember.member!.id}/boards"),
        headers: {
          'Authorization':
              'OAuth oauth_consumer_key="${Auth.apiKey}", oauth_token="${_auth.apiToken}"',
        });

    if (response.statusCode >= 400) {
      log(response.body);
      throw Exception(response.body);
    }

    final responseJson = jsonDecode(response.body) as List<dynamic>;

    //check if need update, create, delete
    for (var board in responseJson) {
      final index = boardsById.keys.toList().indexOf(board['id']);
      if (index == -1) {
        Board tmpBoard = Board.fromJson(board);
        boards.add(tmpBoard);
        boardsById[board['id']] = tmpBoard;
        if (boardsByOrganizationId[board['idOrganization']] == null) {
          boardsByOrganizationId[board['idOrganization']] = [tmpBoard];
        } else {
          boardsByOrganizationId[board['idOrganization']]!.add(tmpBoard);
        }
      } else {
        boards[index].update(board);
      }
    }

    //for board that not in responseJson
    for (var board in boards) {
      if (!responseJson.any((element) => element['id'] == board.id)) {
        boards.remove(board);
        boardsById.remove(board.id);
        boardsByOrganizationId.remove(board.idOrganization);
      }
    }

    notifyListeners();
  }
}

class Board with ChangeNotifier, DiagnosticableTreeMixin {
  final String id;
  String name;
  String desc;
  bool closed;
  String idOrganization;
  String? idEnterprise;
  bool pinned;
  Uri url;
  Uri shortUrl;
  Map labelNames;

  Board({
    required this.id,
    required this.name,
    required this.desc,
    required this.closed,
    required this.idOrganization,
    this.idEnterprise,
    required this.pinned,
    required this.url,
    required this.shortUrl,
    required this.labelNames,
  });

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      closed: json['closed'],
      idOrganization: json['idOrganization'],
      idEnterprise: json['idEnterprise'],
      pinned: json['pinned'],
      url: Uri.parse(json['url']),
      shortUrl: Uri.parse(json['shortUrl']),
      labelNames: json['labelNames'],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('id', id));
    properties.add(StringProperty('name', name));
    properties.add(StringProperty('desc', desc));
    properties.add(FlagProperty('closed', value: closed, ifTrue: 'closed'));
    properties.add(StringProperty('idOrganization', idOrganization));
    properties.add(StringProperty('idEnterprise', idEnterprise));
    properties.add(FlagProperty('pinned', value: pinned, ifTrue: 'pinned'));
    properties.add(DiagnosticsProperty('url', url));
    properties.add(DiagnosticsProperty('shortUrl', shortUrl));
    properties.add(DiagnosticsProperty('labelNames', labelNames));
  }

  update(Map<String, dynamic> json) {
    //check if need update. if need (update and notify)
    bool update = false;

    if (json['name'] != name) {
      name = json['name'];
      update = true;
    }
    if (json['desc'] != desc) {
      desc = json['desc'];
      update = true;
    }
    if (json['closed'] != closed) {
      closed = json['closed'];
      update = true;
    }
    if (json['idOrganization'] != idOrganization) {
      idOrganization = json['idOrganization'];
      update = true;
    }
    if (json['idEnterprise'] != idEnterprise) {
      idEnterprise = json['idEnterprise'];
      update = true;
    }
    if (json['pinned'] != pinned) {
      pinned = json['pinned'];
      update = true;
    }
    if (json['url'] != url) {
      url = Uri.parse(json['url']);
      update = true;
    }
    if (json['shortUrl'] != shortUrl) {
      shortUrl = Uri.parse(json['shortUrl']);
      update = true;
    }
    if (json['labelNames'] != labelNames) {
      labelNames = json['labelNames'];
      update = true;
    }

    if (update) {
      notifyListeners();
    }
  }
}
