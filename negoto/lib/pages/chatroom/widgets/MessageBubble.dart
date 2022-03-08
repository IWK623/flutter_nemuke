import 'package:flutter/material.dart';
import 'package:negoto/Define.dart';
import 'package:negoto/pages/chatroom/Message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe = false;

  const MessageBubble(
    this.message, {
    Key? key,
    required bool isMe,
  }) : super(key: key);

  String getTimeText() {
    if (message.published != null) {
      int minutes = DateTime.now().difference(message.published!).inMinutes;
      if (minutes > 60) {
        return "1時間以上前";
      } else if (minutes > 15) {
        return "15分以上前";
      } else if (minutes > 5) {
        return "5分以上前";
      } else if (minutes > 1) {
        return minutes.toString() + "分前";
      } else {
        return "たった今";
      }
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 2),
            child: Text(getTimeText()),
          ),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8),
            padding: EdgeInsets.fromLTRB(
                AssetStyle.textStyleInput1.fontSize! * 2,
                AssetStyle.textStyleInput1.fontSize!,
                AssetStyle.textStyleInput1.fontSize! * 2,
                AssetStyle.textStyleInput1.fontSize!),
            decoration: BoxDecoration(
              color: isMe
                  ? AssetStyle.textStyleMsg1.color
                  : AssetColor.textColorLight,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: Text(
              message.body,
              style: isMe ? AssetStyle.textStyleMsg2 : AssetStyle.textStyleMsg1,
            ),
          ),
        ],
      ),
    );
  }
}
