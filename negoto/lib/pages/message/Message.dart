import 'package:flutter/material.dart';
import 'package:negoto/pages/message/Header.dart';
import 'package:negoto/pages/message/MessageList.dart';
import 'package:negoto/pages/message/MessageTextField.dart';

import '../../Define.dart';
import '../../widgets/Screen.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [Header(), MessageList()],
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: const MessageTextField())
          ],
        ),
      ),
      color: AssetColor.backColorLight,
    );
  }
}
