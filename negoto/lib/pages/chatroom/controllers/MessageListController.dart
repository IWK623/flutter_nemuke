// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:negoto/pages/chatroom/ChatRoom.dart';
import 'package:negoto/pages/chatroom/Message.dart';
import 'package:negoto/pages/chatroom/controllers/ChatRoomContoroller.dart';

class MessageListController extends ChangeNotifier {
  final ChatRoomController chatRoomController;

  final List<Message> messages = [];
  late FirebaseFirestore firestore;
  late CollectionReference collection;

  MessageListController(this.chatRoomController) {
    firestore = FirebaseFirestore.instance;
    collection = firestore.collection('messages');
  }

  int getLength() {
    return messages.length;
  }

  void sendMessage(Message message) {
    collection
        .add({
          'body': message.body,
          'published': DateTime.now(),
        })
        .then((value) => print("add msg"))
        .catchError((error) => print("$error"));
  }

  void addMessage(Message message) {
    // print(getLength());
    messages.insert(0, message);
    notifyListeners();
  }

  Stream<QuerySnapshot<Object?>> getStream() {
    return collection.orderBy('published').snapshots();
  }

  Future<void> fetchMessages() async {
    getStream().listen((event) {
      for (var dc in event.docChanges) {
        addMessage(Message(dc.doc["body"], key: Key(dc.doc.id)));
      }
    });
  }
}
