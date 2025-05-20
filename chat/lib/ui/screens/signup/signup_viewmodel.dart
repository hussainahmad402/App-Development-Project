import 'dart:developer';
import 'dart:io';
import 'package:chat/core/enums/enums.dart';
import 'package:chat/core/models/user_model.dart';
import 'package:chat/core/others/base_viewmodel.dart';
import 'package:chat/core/services/auth_service.dart';
import 'package:chat/core/services/database_service.dart';
import 'package:chat/core/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupViewmodel extends BaseViewmodel {
  final AuthService _auth;
  final DatabaseService _db;
  // final StorageService _storage;
  SignupViewmodel(this._auth, this._db,
  // this._storage
  );

  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmpassword = '';
  // final _picker = ImagePicker();

  // File? _image;
  // File? get image => _image;

  // pickImage() async {
  //   final pic = await _picker.pickImage(source: ImageSource.gallery);

  //   if (pic != null) {
  //     _image = File(pic.path);
  //     notifyListeners();
  //   }
  // }

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
    // String? downloadUrl;
    try {
      if (_password != _confirmpassword) {
        throw Exception("The password do not match");
      }

      final res = await _auth.signup(_email, _password);

      if (res != null) {

        // if(_image !=null){
        //   downloadUrl= await _storage.uploadImage(_image!);
        // }

        UserModel user = UserModel(
          uid: res.uid,
          name: _name,
          email: _email,
          password: _password,
          // imageurl: downloadUrl
        );

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
