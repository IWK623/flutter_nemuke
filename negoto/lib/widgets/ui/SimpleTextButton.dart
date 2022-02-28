import 'package:flutter/material.dart';
import 'package:negoto/Define.dart';

class SimpleTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const SimpleTextButton(this.text, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            // padding: MaterialStateProperty.all(EdgeInsets.zero),
            // minimumSize: MaterialStateProperty.all(Size.zero),
            // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
        onPressed: onPressed,
        child: Text(text, style: AssetStyle.textStyleBtn1));
  }
}
