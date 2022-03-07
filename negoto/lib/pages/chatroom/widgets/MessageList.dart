import 'package:flutter/material.dart';
import 'package:negoto/pages/chatroom/ChatRoomContoroller.dart';
import 'package:negoto/pages/chatroom/widgets/MessageBubble.dart';

class MessageList extends StatelessWidget {
  final ChatRoomController controller;

  const MessageList(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        controller: controller.scrollController,
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 64),
        children: [
          const MessageBubble("チョコラBB買うの忘れてた。口内炎が痛くて泣きそう。", isMe: false),
          const MessageBubble("テストで100点とった", isMe: false),
          const MessageBubble("今日はひな祭りか、忘れてた", isMe: false),
          const MessageBubble("ぺドリうますぎ、バルセロナの未来は明るい。あとガビも", isMe: false),
          const MessageBubble("今日卒業式だった", isMe: false),
          const MessageBubble("今日ニトリで布団買った", isMe: false),
          const MessageBubble(
            "この2週間で6キロ太りました。明日からダイエットします。まずはランニングしよ。",
            isMe: false,
          ),
          const MessageBubble(
            "眠いのに寝れない",
            isMe: true,
          ),
          const MessageBubble("部屋にゴキブリ出たんだけど", isMe: false),
          TextButton(onPressed: () => {}, child: const Text("top"))
        ],
      ),
    );
  }
}
