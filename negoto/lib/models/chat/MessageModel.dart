import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message {
  final String body;
  DateTime? published;
  Key? key;
  bool? isMe = false;

  Message(this.body, {this.published, this.key});

  @override
  bool operator ==(m) {
    if (m is! Message) {
      return false;
    } else if (m.key == null || key == null) {
      return false;
    } else {
      return m.key == key;
    }
  }
}
