import 'dart:async';
import 'package:flutter/material.dart';
import 'package:negoto/controllers/chatroom/ChatRoomController.dart';

class ChatRoomHeaderController extends ChangeNotifier {
  final ChatRoomController chatRoomController;
  int _timerTick = 0;
  late Timer _timer;

  ChatRoomHeaderController(this.chatRoomController);

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), tick);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void tick(Timer timer) {
    _timerTick = timer.tick;
    notifyListeners();
  }

  int getTimerTick() {
    return _timerTick;
  }

  String getTime() {
    return getTimerTick().toString();
  }
}
