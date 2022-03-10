// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:negoto/models/chat/MessageModel.dart';
import 'package:negoto/controllers/chatroom/ChatRoomController.dart';

class MessageListController extends ChangeNotifier {
  final ChatRoomController chatRoomController;

  final List<Message> messages = [];

  MessageListController(this.chatRoomController);

  int getLength() {
    return messages.length;
  }

  void addMessage(Message message) {
    if (!messages.contains(message)) {
      messages.insert(0, message);
      notifyListeners();
    }
  }
}
