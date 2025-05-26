import 'dart:developer';

import 'package:chat/core/enums/enums.dart';
import 'package:chat/core/models/user_model.dart';
import 'package:chat/core/others/base_viewmodel.dart';
import 'package:chat/core/services/database_service.dart';

class ChatListViewmodel extends BaseViewmodel {
  final DatabaseService _db;
  final UserModel _currentUser;

  ChatListViewmodel(this._db, this._currentUser) {
    fetchUser();
  }
  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  List<UserModel> _filteredUsers = [];
  List<UserModel> get filteredUsers => _filteredUsers;

  search(String value) {
    _filteredUsers = _users.where((e) => e.name!.toLowerCase().contains(value)).toList();
    notifyListeners();
  }

  fetchUser() async {
    try {
      setstate(ViewState.loading);
      // final res = await _db.fetchUser(_currentUser.uid!);
      _db.fetchUserStream(_currentUser.uid!).listen((data){
        _users = data.docs.map((e)=>UserModel.fromMap(e.data())).toList();
        _filteredUsers = _users;
        notifyListeners();
      });
       


      // if (res != null) {
      //   _users = res.map((e) => UserModel.fromMap(e)).toList();
      //   _filteredUsers = users;
      //   notifyListeners();
      // }
      setstate(ViewState.idle);
    } catch (e) {
      log("Error Fetching Users : $e");
    }
  }
}
