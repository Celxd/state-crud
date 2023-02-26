import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final bool isMe;
  final String? profile;

  const MessageWidget({
    required this.message,
    required this.isMe,
    required this.profile,
  });

  static const radius = Radius.circular(12);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        isMe? 
        Row(
          children: [
            floatBody(context),
            Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.only(
                bottom: 16,
                right: 16,
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(profile!),
              ),
            ),
          ],
        ) : 
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(profile!),
              ),
            ),
            floatBody(context),
          ],
        )
      ],
    );
  }

  Widget buildMessage() => Column(
    crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        message,
        style: TextStyle(color: isMe ? Colors.white : Colors.black),
        textAlign: isMe ? TextAlign.end : TextAlign.start,
      ),
    ],
  );

  Widget floatBody(context) => Container(
    padding: const EdgeInsets.all(16),
    margin: isMe ?
      const EdgeInsets.only(
        left: 16,
        top: 16,
        bottom: 16,
        right: 5
      ) :
      const EdgeInsets.only(
        right: 16,
        top: 16,
        bottom: 16,
        left: 5
      ),
    constraints: const BoxConstraints(maxWidth: 140),
    decoration: BoxDecoration(
      color: isMe ? Theme.of(context).colorScheme.secondary : Colors.grey[300],
      borderRadius: isMe ?
        const BorderRadius.only(
          topLeft: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ) :
        const BorderRadius.only(
          topRight: radius,
          bottomRight: radius,
          bottomLeft: radius,
        ),
    ),
    child: buildMessage(),
  );
}