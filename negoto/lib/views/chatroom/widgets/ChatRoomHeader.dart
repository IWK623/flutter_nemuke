import 'package:flutter/material.dart';
import 'package:negoto/controllers/chatroom/ChatRoomController.dart';
import 'package:negoto/controllers/chatroom/ChatRoomHeaderController.dart';
import 'package:negoto/define.dart';
import 'package:negoto/widgets/ui/SimpleLabel.dart';
import 'package:negoto/widgets/ui/SimpleTextButton.dart';
import 'package:provider/provider.dart';

class ChatRoomHeader extends StatelessWidget {
  final ChatRoomController controller;
  const ChatRoomHeader(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void closeMessage() {
      Navigator.of(context).pop();
    }

    var safePadding = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      height: 180,
      padding: EdgeInsets.only(top: safePadding + 12, bottom: 12),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              spreadRadius: 1.0,
              blurRadius: 12,
              offset: Offset(0, 0))
        ],
        color: AssetColor.backColorDark,
      ),
      child: ChangeNotifierProvider<ChatRoomHeaderController>(
        create: (_) => controller.chatRoomHeaderController,
        builder: (a, b) => Consumer<ChatRoomHeaderController>(
            builder: (context, controller, child) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SimpleLabel(
                            controller.getTime(), AssetStyle.textStyle2),
                        SimpleLabel("分", AssetStyle.textStyle1),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    SimpleLabel("そろそろ寝ませんか?", AssetStyle.textStyle1),
                    SimpleTextButton("閉じて寝る", closeMessage)
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
