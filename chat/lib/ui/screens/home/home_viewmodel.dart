import 'package:chat/core/enums/enums.dart';
import 'package:chat/core/models/user_model.dart';
import 'package:chat/core/others/base_viewmodel.dart';
import 'package:chat/core/services/database_service.dart';

class HomeViewmodel extends BaseViewmodel{
  final DatabaseService _db;

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  HomeViewmodel(this._db,String uid){
    fetchUserData(uid);
  }
  fetchUserData(String uid)async{
    setstate(ViewState.loading);
    final res = await _db.loadUser(uid);

    if (res != null) _currentUser = UserModel.fromMap(res);
    setstate(ViewState.idle);
    
  }
}