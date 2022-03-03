import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:negoto/Define.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MessageTextField();
  }
}

class _MessageTextField extends State<MessageTextField> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
      child: CupertinoTextField(
        controller: _textController,
        decoration: BoxDecoration(
          color: AssetColor.backColorDark,
          borderRadius: BorderRadius.circular(50),
        ),
        style: AssetStyle.textStyleInput1,
        padding: EdgeInsets.fromLTRB(
            AssetStyle.textStyleInput1.fontSize! * 2,
            AssetStyle.textStyleInput1.fontSize!,
            AssetStyle.textStyleInput1.fontSize! * 2,
            AssetStyle.textStyleInput1.fontSize!),
        maxLength: 60,
        suffix: Container(
          padding: const EdgeInsets.only(right: 12),
          child: const Icon(
            CupertinoIcons.arrow_up_circle_fill,
            color: AssetColor.textColorBtn,
            size: 28,
          ),
        ),
      ),
    );
  }
}