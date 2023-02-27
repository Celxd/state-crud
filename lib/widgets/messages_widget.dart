import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:state/api/firebase_api.dart';
import 'package:state/model/Message.dart';
import 'package:state/widgets/message_widget.dart';


class MessagesWidget extends StatelessWidget {
  const MessagesWidget({super.key});

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Message>>(
    stream: FirebaseApi.getMessages("all"),
    builder: (context, snapshot) {
      final messages = snapshot.data;

      return messages!.isEmpty ? const Text("Say somethin") : ListView.builder(
        physics: const BouncingScrollPhysics(),
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];

          return MessageWidget(
            message: message.message,
            isMe: message.username == FirebaseAuth.instance.currentUser!.displayName,
            profile: message.profile,
          );
        }
      );
    },
  );
}