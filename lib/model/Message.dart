import '../util/utils.dart';

class MessageField {
  static final String createdAt = 'createdAt';
}

class Message {
  final String? username;
  final String message;
  final DateTime createdAt;
  final String? profile;

  const Message({
    required this.username,
    required this.message,
    required this.createdAt,
    required this.profile,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
        username: json['username'],
        message: json['message'],
        createdAt: Utils.toDateTime(json['createdAt']),
        profile: json['profile'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'message': message,
        'createdAt': Utils.fromDateTimeToJson(createdAt),
        'profile': profile,
      };
}