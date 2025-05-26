// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? imageurl;
  final String? password;
  final Map<String,dynamic>? lastMessage;
  final int? unreadCounter;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.imageurl,
    this.password,
    this.lastMessage,
    this.unreadCounter
    
  });

  

 


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'imageurl': imageurl,
      'password': password,
      'lastMessage': lastMessage,
      'unreadCounter': unreadCounter,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      imageurl: map['imageurl'] != null ? map['imageurl'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      lastMessage: map['lastMessage'] != null ? Map<String,dynamic>.from((map['lastMessage'] as Map<String,dynamic>)) : null,
      unreadCounter: map['unreadCounter'] != null ? map['unreadCounter'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, imageurl: $imageurl, password: $password, lastMessage: $lastMessage, unreadCounter: $unreadCounter)';
  }
}
