import 'package:chatify/common/constants/json_key_constants.dart';

class ChatModel {
  final String toId;
  final String message;
  final String read;
  final String fromId;
  final String sent;

  ChatModel({
    required this.toId,
    required this.message,
    required this.read,
    required this.fromId,
    required this.sent,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        toId: json[JsonKeyConstants.toId],
        message: json[JsonKeyConstants.message],
        read: json[JsonKeyConstants.read],
        fromId: json[JsonKeyConstants.fromId],
        sent: json[JsonKeyConstants.sent],
      );

  Map<String, dynamic> toJson() => {
        JsonKeyConstants.toId: toId,
        JsonKeyConstants.message: message,
        JsonKeyConstants.read: read,
        JsonKeyConstants.fromId: fromId,
        JsonKeyConstants.sent: sent,
      };
}
