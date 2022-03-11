import 'package:flutter/material.dart';
import 'package:negoto/models/chat/MessageModel.dart';
import 'package:negoto/controllers/chatroom/MessageListController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomController {
  late FirebaseFirestore firestore;
  late CollectionReference collection;

  ScrollController scrollController = ScrollController();
  TextEditingController textController = TextEditingController();
  late MessageListController messageListController =
      MessageListController(this);

  final String uuid = UniqueKey().toString();

  ChatRoomController() {
    firestore = FirebaseFirestore.instance;
    collection = firestore.collection('messages');
    loadMessage(10);
  }

  void scrollBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
          0, //scrollController.position.maxScrollExtent <= top
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300));
    }
  }

  void sendMessage(Message message) {
    collection.add({
      'body': message.body,
      'published': DateTime.now(),
    }).then((doc) {
      message.key = Key(doc.id);
      message.isMe = true;
      message.published = DateTime.now();
      messageListController.addMessage(message);
    });
    // .catchError((error) => print("$error"));
    scrollBottom();
    textController.text = "";
  }

  static DateTime parseTime(dynamic date) {
    return date is Timestamp ? (date).toDate() : (date as DateTime);
  }

  static Message getMessageFromDoc(DocumentSnapshot<Object?> doc) {
    return Message(
      doc.data().toString().contains('body') ? doc.get('body') : '',
      published: parseTime(doc.get("published")),
      key: Key(doc.id),
    );
  }

  void loadMessage(int last) {
    collection
        .orderBy('published')
        .limitToLast(last)
        .snapshots()
        .listen((event) {
      for (var dc in event.docChanges) {
        messageListController
            .addMessage(getMessageFromDoc(dc.doc)..isMe = false);
      }
    });
  }
}
