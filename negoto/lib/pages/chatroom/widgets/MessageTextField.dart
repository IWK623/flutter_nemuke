import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:negoto/Define.dart';
import 'package:negoto/controller/FirestoreController.dart';
import 'package:negoto/pages/chatroom/ChatRoomContoroller.dart';

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
      print(widget.controller.textController.text);
      var firestore = FirestoreMessageController();
      firestore.FirestoreAddMessage();
    }
  }

  @override
  Widget build(BuildContext context) {
    var scrollController = widget.controller.scrollController;
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
          icon: Icon(
            CupertinoIcons.arrow_up_circle_fill,
            color:
                canSend ? AssetColor.textColorLight : AssetColor.backColorLight,
            size: 28,
          ),
          onPressed: _sendMessage,
        ),
        onChanged: _onChanged,
        onTap: () => {
          scrollController.animateTo(scrollController.position.maxScrollExtent,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300))
        },
      ),
    );
  }
}
