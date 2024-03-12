import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'user_info_service.dart';
import 'auth_service.dart';

class Organizations with ChangeNotifier, DiagnosticableTreeMixin {
  final TokenMember _tokenMember;
  final Auth _auth;
  List<Organization> organizations = [];
  Map<String, Organization> organizationsById = {};

  Organizations(this._tokenMember, this._auth) {
    update();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<TokenMember>('tokenMember', _tokenMember));
    properties
        .add(IterableProperty<Organization>('organizations', organizations));
  }

  update() async {
    if (_auth.apiToken == null) {
      return;
    }

    if (_tokenMember.member?.id == null) {
      return;
    }
    final response = await http.get(
        Uri.parse(
            "https://api.trello.com/1/members/${_tokenMember.member!.id}/organizations"),
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
    for (var organization in responseJson) {
      _updateData(organization);
    }

    //for organization that not in responseJson
    for (var organization in organizations) {
      if (!responseJson.any((element) => element['id'] == organization.id)) {
        organizations.remove(organization);
        organizationsById.remove(organization.id);
      }
    }

    notifyListeners();
  }

  _updateData(dynamic organization) {
    var index =
        organizations.indexWhere((element) => element.id == organization['id']);
    if (index == -1) {
      Organization tmpOrganization =
          Organization.fromJson(organization, _tokenMember, _auth, this);
      organizations.add(tmpOrganization);
      organizationsById[organization['id']] = tmpOrganization;
    } else {
      organizations[index]._updateJson(organization);
    }
  }

  createOrganization(
      String displayName, String? desc, String? name, Uri? website) async {
    if (_auth.apiToken == null) {
      return;
    }

    if (_tokenMember.member?.id == null) {
      return;
    }
    final response = await http.post(
      Uri.parse(
          "https://api.trello.com/1/organizations?displayName=$displayName&desc=$desc&name=$name&website=$website"),
      headers: {
        'Authorization':
            'OAuth oauth_consumer_key="${Auth.apiKey}", oauth_token="${_auth.apiToken}"',
      },
    );

    if (response.statusCode >= 400) {
      log(response.body);
      throw Exception(response.body);
    }

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
    _updateData(responseJson);
    notifyListeners();
  }
}

class Organization with ChangeNotifier, DiagnosticableTreeMixin {
  final TokenMember _tokenMember;
  final Auth _auth;
  Organizations organizations;
  final String id;
  String name;
  List<String> credits;
  String displayName;
  String desc;
  String? domainName;
  List<String> idBoards;
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
    this.idEnterprise,
    required this.idMemberCreator,
    required this.invited,
    required this.invitations,
    required this.membersCount,
    required this.url,
    this.logoUrl,
    required this.memberships,
    required TokenMember tokenMember,
    required Auth auth,
    required this.organizations,
  })  : _tokenMember = tokenMember,
        _auth = auth;

  factory Organization.fromJson(Map<String, dynamic> json,
      TokenMember tokenMember, Auth auth, Organizations organizations) {
    return Organization(
      id: json['id'],
      name: json['name'],
      credits: List<String>.from(json['credits']),
      displayName: json['displayName'],
      desc: json['desc'],
      domainName: json['domainName'],
      idBoards: List<String>.from(json['idBoards']),
      idEnterprise: json['idEnterprise'],
      idMemberCreator: json['idMemberCreator'],
      invited: json['invited'],
      invitations: List<String>.from(json['invitations']),
      membersCount: json['membersCount'],
      url: Uri.parse(json['url']),
      logoUrl: json['logoUrl'] != null ? Uri.parse(json['logoUrl']) : null,
      memberships: [],
      tokenMember: tokenMember,
      auth: auth,
      organizations: organizations,
    );
  }

  update(
    String? name,
    String? displayName,
    String? desc,
    Uri? website,
    String? prefsAssociatedDomain,
    String? prefsExternalMembersDisabled,
    String? prefsGoogleAppsVersion,
    String? prefsBoardVisibilityRestrictOrg,
    String? prefsBoardVisibilityRestrictPrivate,
    String? prefsBoardVisibilityRestrictPublic,
    String? prefsOrgInviteRestrict,
    String? prefsPermissionLevel,
  ) async {
    if (_auth.apiToken == null) {
      return;
    }

    if (_tokenMember.member?.id == null) {
      return;
    }
    final response = await http.post(
      Uri.parse(
          "https://api.trello.com/1/organizations/${id}?name=$name&displayName=$displayName&desc=$desc&website=$website&prefs/associatedDomain=$prefsAssociatedDomain&prefs/externalMembersDisabled=$prefsExternalMembersDisabled&prefs/googleAppsVersion=$prefsGoogleAppsVersion&prefs/boardVisibilityRestrict/org=$prefsBoardVisibilityRestrictOrg&prefs/boardVisibilityRestrict/private=$prefsBoardVisibilityRestrictPrivate&prefs/boardVisibilityRestrict/public=$prefsBoardVisibilityRestrictPublic&prefs/orgInviteRestrict=$prefsOrgInviteRestrict&prefs/permissionLevel=$prefsPermissionLevel"),
      headers: {
        'Authorization':
            'OAuth oauth_consumer_key="${Auth.apiKey}", oauth_token="${_auth.apiToken}"',
      },
    );

    if (response.statusCode >= 400) {
      log(response.body);
      throw Exception(response.body);
    }

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
    _update();
  }

  _update() async {
    if (_auth.apiToken == null) {
      return;
    }

    if (_tokenMember.member?.id == null) {
      return;
    }

    final response = await http.get(
        Uri.parse("https://api.trello.com/1/organizations/${id}"),
        headers: {
          'Authorization':
              'OAuth oauth_consumer_key="${Auth.apiKey}", oauth_token="${_auth.apiToken}"',
        });

    if (response.statusCode >= 400) {
      log(response.body);
      throw Exception(response.body);
    }

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    _updateJson(responseJson);
    notifyListeners();
  }

  _updateJson(Map<String, dynamic> json) {
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

  delete() async {
    if (_auth.apiToken == null) {
      return;
    }

    if (_tokenMember.member?.id == null) {
      return;
    }
    final response = await http.delete(
      Uri.parse("https://api.trello.com/1/organizations/${id}"),
      headers: {
        'Authorization':
            'OAuth oauth_consumer_key="${Auth.apiKey}", oauth_token="${_auth.apiToken}"',
      },
    );

    if (response.statusCode >= 400) {
      log(response.body);
      throw Exception(response.body);
    }

    //delete organization in provider
    organizations.organizationsById.remove(id);
    organizations.organizations.remove(this);

    notifyListeners();

    organizations.update();
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
