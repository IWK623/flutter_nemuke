import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Color? color;
  final Widget? child;

  const Screen(this.child, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      height: double.infinity,
      child: child,
    );
  }
}
