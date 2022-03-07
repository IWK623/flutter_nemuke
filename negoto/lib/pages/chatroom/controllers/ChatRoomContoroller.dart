import 'package:flutter/material.dart';
import 'package:negoto/pages/chatroom/Message.dart';
import 'package:negoto/pages/chatroom/controllers/MessageListController.dart';

class ChatRoomController {
  ScrollController scrollController = ScrollController();
  TextEditingController textController = TextEditingController();

  late MessageListController messageListController =
      MessageListController(this);

  ChatRoomController() {
    messageListController.fetchMessages();
    scrollController.addListener(() {
      scrollBottom();
    });
  }

  void sendMessage(Message message) {
    messageListController.sendMessage(message);
    scrollBottom();
    textController.text = "";
  }

  void scrollBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
          0, //scrollController.position.maxScrollExtent <= top
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300));
    }
  }
}
