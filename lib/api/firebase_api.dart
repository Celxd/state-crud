import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/Message.dart';
import '../util/utils.dart';


class FirebaseApi {
  static uploadMessage (String message, String? username) async {
    final refMessages = FirebaseFirestore.instance.collection('chats/all/messages');

    final newMessage = Message(
      username: username,
      message: message,
      createdAt: DateTime.now(),
      profile: FirebaseAuth.instance.currentUser!.photoURL,
    );
    await refMessages.add(newMessage.toJson());
  }

  static Stream<List<Message>> getMessages(String idUser) =>
      FirebaseFirestore.instance
          .collection('chats/all/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));
}