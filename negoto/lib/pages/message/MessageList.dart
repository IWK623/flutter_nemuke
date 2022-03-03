import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:negoto/pages/message/MessageBubble.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MessageList();
  }
}

class _MessageList extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 64),
        children: [
          MessageBubble("チョコラBB買うの忘れてた。口内炎が痛くて泣きそう。"),
          MessageBubble("テストで100点とった"),
          MessageBubble("今日はひな祭りか、忘れてた"),
          MessageBubble("ぺドリうますぎ、バルセロナの未来は明るい。あとガビも"),
          MessageBubble("今日卒業式だった"),
          MessageBubble("今日ニトリで布団買った"),
          MessageBubble("この２週間で６キロ太りました。明日からダイエットします。まずはランニングしよ。"),
          MessageBubble(
            "眠いのに寝れない",
            isMe: true,
          ),
          MessageBubble("部屋にゴキブリ出たんだけど"),
        ],
      ),
    );
  }
}
