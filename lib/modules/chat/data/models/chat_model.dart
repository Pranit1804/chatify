import 'package:chatify/common/constants/json_key_constants.dart';

class ChatModel {
  final String recieverId;
  final String message;
  final String read;
  final String senderId;
  final DateTime createdAt;

  ChatModel({
    required this.recieverId,
    required this.message,
    required this.read,
    required this.senderId,
    required this.createdAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        recieverId: json[JsonKeyConstants.recieverId],
        message: json[JsonKeyConstants.message],
        read: json[JsonKeyConstants.read],
        senderId: json[JsonKeyConstants.senderId],
        createdAt: DateTime.parse(json[JsonKeyConstants.createdAt]),
      );

  Map<String, dynamic> toJson() => {
        JsonKeyConstants.recieverId: recieverId,
        JsonKeyConstants.message: message,
        JsonKeyConstants.read: read,
        JsonKeyConstants.senderId: senderId,
        JsonKeyConstants.createdAt: createdAt.toIso8601String(),
      };
}
