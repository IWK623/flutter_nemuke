import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:negoto/controllers/chatroom/MessageListController.dart';
import 'package:negoto/models/chat/MessageModel.dart';
import 'package:negoto/controllers/chatroom/ChatRoomController.dart';
import 'package:negoto/views/chatroom/widgets/MessageBubble.dart';
import 'package:provider/provider.dart';

class MessageList extends StatelessWidget {
  final ChatRoomController controller;

  const MessageList(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ChangeNotifierProvider<MessageListController>(
      create: (_) => controller.messageListController,
      builder: (a, b) => Consumer<MessageListController>(
          builder: (context, controller, child) {
        return ListView.builder(
          controller: controller.chatRoomController.scrollController,
          reverse: true,
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 64, bottom: 64),
          itemCount: controller.getLength(),
          itemBuilder: (c, i) => MessageBubble(
            controller.messages[i],
            controller.messages[i].isMe ?? true,
            key: controller.messages[i].key,
          ),
        );
      }),
    ));

    // return
  }
}
