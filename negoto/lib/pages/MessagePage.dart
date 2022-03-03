import 'package:flutter/material.dart';

import '../../Define.dart';
import '../../widgets/Screen.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Screen(
      Center(),
      color: AssetColor.backColorLight,
    );
  }
}
