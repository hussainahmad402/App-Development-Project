import 'package:chat/core/others/base_viewmodel.dart';
import 'package:chat/core/services/database_service.dart';

class HomeViewmodel extends BaseViewmodel{
  final DatabaseService _db;


  HomeViewmodel(this._db);
  
}