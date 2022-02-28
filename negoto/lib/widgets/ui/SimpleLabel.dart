import 'package:flutter/material.dart';

class SimpleLabel extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const SimpleLabel(this.text, this.style, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
