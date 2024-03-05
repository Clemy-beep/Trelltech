import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:trelltech/arbory/boards_services.dart';

import 'user_info_service.dart';
import 'auth_service.dart';

class Organizations with ChangeNotifier, DiagnosticableTreeMixin {
  final Auth auth;
  TokenMember tokenMember;
  List<Organization> organizations = [];

  Organizations(this.tokenMember, this.auth) {
    update();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('organizations', organizations));
  }

  update() async {
    if (tokenMember.auth.apiToken == null) {
      return;
    }

    final response = await http.get(
        Uri.parse(
            "https://api.trello.com/1/members/${tokenMember.member!.id}/organizations"),
        headers: {
          'Authorization':
              'OAuth oauth_consumer_key="${Auth.apiKey}", oauth_token="${tokenMember.auth.apiToken}"',
        });

    if (response.statusCode >= 400) {
      log(response.body);
      throw Exception(response.body);
    }

    final responseJson = jsonDecode(response.body) as List<dynamic>;

    //check if need update, create, delete
    for (var organization in responseJson) {
      var index = organizations
          .indexWhere((element) => element.id == organization['id']);
      if (index == -1) {
        organizations.add(Organization.fromJson(organization));
      } else {
        organizations[index].update(organization);
      }
    }

    //for organization that not in responseJson
    organizations.removeWhere((element) {
      var index = responseJson
          .indexWhere((organization) => organization['id'] == element.id);
      return index == -1;
    });

    notifyListeners();
  }
}

class Organization with ChangeNotifier, DiagnosticableTreeMixin {
  //TODO: Constructor not finish and update have not all fields yet
  final String id;
  String name;
  List<String> credits;
  String displayName;
  String desc;
  String? domainName;
  List<String> idBoards;
  List<Board> boards;
  String? idEnterprise;
  String idMemberCreator;
  bool invited;
  List<String> invitations;
  int membersCount;
  Uri url;
  Uri? logoUrl;
  List<Membership> memberships;

  Organization({
    required this.id,
    required this.name,
    required this.credits,
    required this.displayName,
    required this.desc,
    this.domainName,
    required this.idBoards,
    required this.boards,
    this.idEnterprise,
    required this.idMemberCreator,
    required this.invited,
    required this.invitations,
    required this.membersCount,
    required this.url,
    this.logoUrl,
    required this.memberships,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'],
      name: json['name'],
      credits: List<String>.from(json['credits']),
      displayName: json['displayName'],
      desc: json['desc'],
      domainName: json['domainName'],
      idBoards: List<String>.from(json['idBoards']),
      boards: [],
      idEnterprise: json['idEnterprise'],
      idMemberCreator: json['idMemberCreator'],
      invited: json['invited'],
      invitations: List<String>.from(json['invitations']),
      membersCount: json['membersCount'],
      url: Uri.parse(json['url']),
      logoUrl: json['logoUrl'] != null ? Uri.parse(json['logoUrl']) : null,
      memberships: [],
    );
  }

  update(Map<String, dynamic> json) {
    //check if need update. if need (update and notify)
    bool update = false;

    if (json['name'] != name) {
      name = json['name'];
      update = true;
    }

    if (json['credits'] != credits) {
      credits = List<String>.from(json['credits']);
      update = true;
    }

    if (json['displayName'] != displayName) {
      displayName = json['displayName'];
      update = true;
    }

    if (json['desc'] != desc) {
      desc = json['desc'];
      update = true;
    }

    if (json['domainName'] != domainName) {
      domainName = json['domainName'];
      update = true;
    }

    if (json['idBoards'] != idBoards) {
      idBoards = List<String>.from(json['idBoards']);
      update = true;
    }

    if (json['idEnterprise'] != idEnterprise) {
      idEnterprise = json['idEnterprise'];
      update = true;
    }

    if (json['idMemberCreator'] != idMemberCreator) {
      idMemberCreator = json['idMemberCreator'];
      update = true;
    }

    if (json['invited'] != invited) {
      invited = json['invited'];
      update = true;
    }

    if (json['invitations'] != invitations) {
      invitations = List<String>.from(json['invitations']);
      update = true;
    }

    if (json['membersCount'] != membersCount) {
      membersCount = json['membersCount'];
      update = true;
    }

    if (json['url'] != url) {
      url = Uri.parse(json['url']);
      update = true;
    }

    if (json['logoUrl'] != logoUrl) {
      logoUrl = json['logoUrl'] != null ? Uri.parse(json['logoUrl']) : null;
      update = true;
    }

    if (update) {
      notifyListeners();
    }
  }
}

class Membership {
  final String idMember;
  final String memberType;
  final bool unconfirmed;
  final bool deactivated;
  final String id;

  Membership({
    required this.idMember,
    required this.memberType,
    required this.unconfirmed,
    required this.deactivated,
    required this.id,
  });

  factory Membership.fromJson(Map<String, dynamic> json) {
    return Membership(
      idMember: json['idMember'],
      memberType: json['memberType'],
      unconfirmed: json['unconfirmed'],
      deactivated: json['deactivated'],
      id: json['id'],
    );
  }
}
