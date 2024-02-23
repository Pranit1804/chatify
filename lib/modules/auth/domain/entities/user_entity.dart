import 'package:chatify/common/constants/json_key_constants.dart';

class UserEntity {
  final String id;
  final String username;
  final String inviteCode;

  UserEntity({
    required this.id,
    required this.username,
    required this.inviteCode,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json[JsonKeyConstants.id],
        username: json[JsonKeyConstants.username],
        inviteCode: json[JsonKeyConstants.inviteCode],
      );

  Map<String, dynamic> toJson() => {
        JsonKeyConstants.id: id,
        JsonKeyConstants.username: username,
        JsonKeyConstants.inviteCode: inviteCode,
      };
}
