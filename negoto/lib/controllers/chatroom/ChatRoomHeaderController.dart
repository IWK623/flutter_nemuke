import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:negoto/controllers/chatroom/ChatRoomController.dart';

class ChatRoomHeaderController extends ChangeNotifier {
  final ChatRoomController chatRoomController;
  String message = '';
  bool isTimerStarted = false;

  ChatRoomHeaderController(this.chatRoomController);

  void changeMessage(String val) {
    message = val;
    notifyListeners();
  }

  void changeTimerStart() {
    isTimerStarted = true;
    notifyListeners();
  }

  String getMessage() {
    return message;
  }
}
