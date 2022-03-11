import 'package:flutter/material.dart';
import 'package:negoto/models/user/UserModel.dart';
import 'package:negoto/views/mainpage/MainPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: MainPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
