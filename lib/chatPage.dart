import 'package:flutter/material.dart';
import 'package:state/widgets/messages_widget.dart';
import 'package:state/widgets/new_message_widget.dart';

class chatPage extends StatefulWidget {
  const chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const MessagesWidget(),
              ),
            ),
            const NewMessageWidget(),
          ],
        )
      ),
    );
  }
}