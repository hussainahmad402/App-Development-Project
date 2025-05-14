import 'dart:developer';

import 'package:chat/core/models/user_model.dart';
import 'package:chat/core/others/base_viewmodel.dart';
import 'package:chat/core/services/database_service.dart';

class ChatListViewmodel extends BaseViewmodel {

  final DatabaseService _db;
  final UserModel _currentUser;

  ChatListViewmodel(this._currentUser,this._db){
    fetchUser();
  }
  fetchUser() async{
    try {
      
    } catch (e) 
    {
      log("Error Fetching Users : $e");
      
    }
  }
}
