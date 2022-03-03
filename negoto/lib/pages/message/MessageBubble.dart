import 'package:flutter/material.dart';
import 'package:negoto/Define.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  bool _isMe = false;

  MessageBubble(
    this.message, {
    Key? key,
    bool? isMe,
  }) : super(key: key) {
    if (isMe != null) _isMe = isMe;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          _isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          padding: EdgeInsets.fromLTRB(
              AssetStyle.textStyleInput1.fontSize! * 2,
              AssetStyle.textStyleInput1.fontSize!,
              AssetStyle.textStyleInput1.fontSize! * 2,
              AssetStyle.textStyleInput1.fontSize!),
          decoration: BoxDecoration(
            color: _isMe
                ? AssetStyle.textStyleMsg1.color
                : AssetColor.textColorLight,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.only(bottom: 12),
          child: Text(
            message,
            style: _isMe ? AssetStyle.textStyleMsg2 : AssetStyle.textStyleMsg1,
          ),
        ),
      ],
    );
  }
}
