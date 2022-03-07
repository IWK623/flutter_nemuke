import 'package:flutter/material.dart';
import 'package:negoto/pages/chatroom/widgets/ChatRoomHeader.dart';
import 'package:negoto/pages/chatroom/ChatRoomContoroller.dart';
import 'package:negoto/pages/chatroom/widgets/MessageList.dart';
import 'package:negoto/pages/chatroom/widgets/MessageTextField.dart';

import '../../Define.dart';
import '../../widgets/Screen.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Message();
  }
}

class _Message extends State<Message> {
  late ChatRoomController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = ChatRoomController();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    return Screen(
      Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ChatRoomHeader(),
                  MessageList(_messageController)
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: MessageTextField(_messageController))
          ],
        ),
      ),
      color: AssetColor.backColorLight,
    );
  }
}
