import 'package:flutter/foundation.dart';
import 'package:trelltech/arbory/services/auth_service.dart';

import 'boards_services.dart';

class TrelloLists with ChangeNotifier, DiagnosticableTreeMixin {
  Auth _auth;
  Boards _boards;

  TrelloLists(this._auth, this._boards) {
    update();
  }

  update() async {
    if (_auth.apiToken == null) {
      return;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('auth', _auth));
    properties.add(DiagnosticsProperty('boards', _boards));
  }
}
