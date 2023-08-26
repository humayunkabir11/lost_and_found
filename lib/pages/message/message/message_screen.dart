import 'package:flutter/material.dart';
import 'inner_widget/inner_app_bar.dart';
import 'inner_widget/message_bubble.dart';
import 'inner_widget/message_input_field.dart';
import 'inner_widget/message_model.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Message> messages = [
    Message('03.20', 'Hello!', false),
    Message('11.05', 'Hi there!', true),
    Message('08.25', 'How are you?', false),
  ];

  void _scrollToBottom() {

    _scrollController.animateTo(
      _scrollController.position.extentAfter,
      duration: const Duration(milliseconds: 50),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const InnerAppBar(),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final message = messages[index];

                      return MessageBubble(
                        time: message.sender,
                        text: message.text,
                        isMe: message.isMe,
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: MessageInputField(
                controller: messageController,
                onTap: () {
                  if(messageController.text==""){

                  }else{
                    TimeOfDay currentTime = TimeOfDay.now();
                    messages.add(
                      Message(currentTime.format(context).toString(), messageController.text, true),
                    );
                    setState(() {
                      _scrollToBottom();
                      messageController.clear();
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
