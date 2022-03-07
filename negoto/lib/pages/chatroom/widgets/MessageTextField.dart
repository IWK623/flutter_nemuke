import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:negoto/Define.dart';
import 'package:negoto/pages/chatroom/Message.dart';
import 'package:negoto/pages/chatroom/controllers/ChatRoomContoroller.dart';

class MessageTextField extends StatefulWidget {
  final ChatRoomController controller;

  const MessageTextField(this.controller, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MessageTextField();
  }
}

class _MessageTextField extends State<MessageTextField> {
  bool canSend = false;

  void _onChanged(String t) {
    setState(() {
      canSend = t.isNotEmpty;
    });
  }

  void _sendMessage() {
    if (canSend) {
      // ignore: avoid_print
      // var firestore = FirestoreMessageController();
      // firestore.FirestoreAddMessage();
      widget.controller
          .sendMessage(Message(widget.controller.textController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: CupertinoTextField(
        controller: widget.controller.textController,
        placeholder: "メッセージを入力",
        placeholderStyle: AssetStyle.textStyle1,
        // minLines: 2,
        maxLines: 4,
        decoration: BoxDecoration(
          color: AssetColor.backColorDark,
          borderRadius: BorderRadius.circular(20),
        ),
        style: AssetStyle.textStyleInput1,
        padding: EdgeInsets.fromLTRB(
            AssetStyle.textStyleInput1.fontSize! * 2,
            AssetStyle.textStyleInput1.fontSize!,
            AssetStyle.textStyleInput1.fontSize! * 2,
            AssetStyle.textStyleInput1.fontSize!),
        maxLength: 60,
        suffix: IconButton(
          padding: const EdgeInsets.only(right: 12),
          icon: Icon(
            CupertinoIcons.arrow_up_circle_fill,
            color:
                canSend ? AssetColor.textColorLight : AssetColor.backColorLight,
            size: 28,
          ),
          onPressed: _sendMessage,
        ),
        onChanged: _onChanged,
        onTap: () => {widget.controller.scrollBottom()},
      ),
    );
  }
}
