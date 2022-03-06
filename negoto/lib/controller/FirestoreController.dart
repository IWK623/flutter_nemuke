import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreMessageController {
  late FirebaseFirestore firestore;
  late CollectionReference collection;
  FirestoreMessageController() {
    firestore = FirebaseFirestore.instance;
    collection = firestore.collection('messages');
  }

  void FirestoreGetMessage() {
    collection
        .add({
          'body': 'development msg',
          'published': DateTime.now(),
        })
        .then((value) => print("add msg"))
        .catchError((error) => print("$error"));
  }
}
