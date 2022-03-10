import 'package:flutter/material.dart';
import 'package:negoto/Define.dart';
import 'package:negoto/views/chatroom/ChatRoom.dart';
import 'package:negoto/widgets/Screen.dart';
import 'package:negoto/widgets/ui/SimpleLabel.dart';
import 'package:negoto/widgets/ui/SimpleTextButton.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openMessage() => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const Scaffold(body: ChatRoom());
          }))
        };

    return Screen(
      Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        SimpleLabel("寝る準備はできましたか？", AssetStyle.textStyle1),
        SimpleTextButton("メッセージを開く", openMessage),
      ])),
      color: AssetColor.backColorDark,
    );
  }
}
