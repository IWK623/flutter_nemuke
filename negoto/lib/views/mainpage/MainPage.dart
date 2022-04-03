import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:negoto/Define.dart';
import 'package:negoto/controllers/mainpage/MainPageController.dart';
import 'package:negoto/models/user/UserModel.dart';
import 'package:negoto/views/chatroom/ChatRoom.dart';
import 'package:negoto/widgets/Screen.dart';
import 'package:negoto/widgets/ui/SimpleLabel.dart';
import 'package:negoto/widgets/ui/SimpleTextButton.dart';
import 'package:platform_device_id/platform_device_id.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainPageController controller = MainPageController();
    void openMessage() => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const Scaffold(body: ChatRoom());
          }))
        };

    return Screen(
      Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        FutureBuilder(
            future: controller.initUser(),
            builder: (BuildContext context, AsyncSnapshot<UserModel> snap) {
              if (snap.hasData) {
                return Text('${snap.data?.deviceId}');
              } else {
                return Text('async');
              }
            }),
        SimpleLabel("寝る準備はできましたか？", AssetStyle.textStyle1),
        SimpleTextButton("メッセージを開く", openMessage),
      ])),
      color: AssetColor.backColorDark,
    );
  }
}
