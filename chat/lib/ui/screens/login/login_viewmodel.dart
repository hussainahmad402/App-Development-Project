import 'dart:developer';

import 'package:chat/core/enums/enums.dart';
import 'package:chat/core/others/base_viewmodel.dart';
import 'package:chat/core/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewmodel extends BaseViewmodel {
  final AuthService _auth;

  LoginViewmodel(this._auth);

  String _email = '';
  String _password = '';

  void setEmail(String value) {
    _email = value;
    notifyListeners();
    log("Email: $_email");
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
    log("Password: $_password");
  }

  login() async {
    setstate(ViewState.loading);
    try {
      await _auth.login(_email, _password);
      setstate(ViewState.idle);
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      setstate(ViewState.idle);
      rethrow;
    } catch (e) {
      log(e.toString());
      setstate(ViewState.idle);
      rethrow;
    }
  }
}
