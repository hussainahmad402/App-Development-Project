import 'dart:async';
import 'dart:developer';

import 'package:chat/core/models/message_model.dart';
import 'package:chat/core/models/user_model.dart';
import 'package:chat/core/others/base_viewmodel.dart';
import 'package:chat/core/services/chat_service.dart';
import 'package:chat/ui/screens/bottom_navigation/chat_list/chat_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatScreenViewmodel extends BaseViewmodel {
  final ChatService _chatService;
  final UserModel _currentUser;
  final UserModel _receiver;

  StreamSubscription? _subscription;

  ChatScreenViewmodel(this._chatService, this._currentUser, this._receiver) {
    getChatRoom();
        
    _subscription = _chatService.getMessage(chatRoomId).listen((messages) {
      _messages = messages.docs.map((e) => Message.fromMap(e.data())).toList();
      
      notifyListeners();
      
      
    });
  }
  String chatRoomId = "";
  final _messageController = TextEditingController();
  TextEditingController get controller => _messageController;

  List<Message> _messages = [];
  List<Message> get messages => _messages;

  getChatRoom() {
    if (_currentUser.uid.hashCode > _receiver.uid.hashCode) {
      chatRoomId = "${_currentUser.uid}${_receiver.uid}";
    } else {
      chatRoomId = "${_receiver.uid}${_currentUser.uid}";
    }
    
  }

  saveMessage() async {
    try {

      if (_messageController.text.isEmpty){
        throw Exception("Enter some text");
      }

      final now = DateTime.now();
      final message = Message(
        id: now.millisecondsSinceEpoch.toString(),
        content: _messageController.text,
        timeStamp: now,
        senderId: _currentUser.uid,
        receiverId: _receiver.uid,
      );
      await _chatService.saveMessage(message.toMap(), chatRoomId);

      _messageController.clear();
    } catch (e) {
      rethrow;
    }
    
  }
  @override
  void dispose() {
 
    super.dispose();

    _subscription?.cancel();
  }
}
