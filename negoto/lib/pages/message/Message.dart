import 'package:flutter/material.dart';
import 'package:negoto/pages/message/Header.dart';
import 'package:negoto/pages/message/MessageTextField.dart';

import '../../Define.dart';
import '../../widgets/Screen.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: const [Header(), MessageTextField()],
      ),
      color: AssetColor.backColorLight,
    );
  }
}
