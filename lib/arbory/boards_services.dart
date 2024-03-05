//list of board with provider

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:trelltech/arbory/user_info_service.dart';

class Boards with ChangeNotifier, DiagnosticableTreeMixin {
  TokenMember tokenMember;
  List<Board> boards = [];

  Boards(this.tokenMember);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('boards', boards));
  }

  void tokenMemberUpdate() {}
}

class Board with ChangeNotifier, DiagnosticableTreeMixin {
  final String id;
  final String name;
  final String desc;
  final bool closed;
  final String idOrganization;
  final String? idEnterprise;
  final bool pinned;
  final Uri url;
  final Uri shortUrl;
  final List<Map> labelNames;

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
}
