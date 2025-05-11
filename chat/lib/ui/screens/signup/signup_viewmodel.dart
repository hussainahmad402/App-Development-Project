import 'dart:developer';
import 'package:chat/core/enums/enums.dart';
import 'package:chat/core/models/user_model.dart';
import 'package:chat/core/others/base_viewmodel.dart';
import 'package:chat/core/services/auth_service.dart';
import 'package:chat/core/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupViewmodel extends BaseViewmodel {
  final AuthService _auth;
  final DatabaseService _db;
  SignupViewmodel(this._auth, this._db);

  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmpassword = '';

  void setName(String value) {
    _name = value;
    notifyListeners();
    log("Name: $_name");
  }

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

  void confirmPassword(String value) {
    _confirmpassword = value;
    notifyListeners();
    log("Confirm Password: $_confirmpassword");
  }

  signup() async {
    setstate(ViewState.loading);
    try {
      final res = await _auth.signup(_email, _password);

      if (res != null) {
        UserModel user = UserModel(uid: res.uid, name: _name, email: _email,password: _password);

        await _db.saveUser(user.toMap());
      }

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
