import 'package:chatify/common/constants/json_key_constants.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserEntity {
  int? id = 0;
  @Unique(onConflict: ConflictStrategy.replace)
  final String userId;
  final String username;
  final String emailId;
  final String inviteCode;

  UserEntity(
    this.userId,
    this.username,
    this.emailId,
    this.inviteCode,
  );

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        json[JsonKeyConstants.id],
        json[JsonKeyConstants.username],
        json[JsonKeyConstants.email],
        json[JsonKeyConstants.inviteCode],
      );

  Map<String, dynamic> toJson() => {
        JsonKeyConstants.id: userId,
        JsonKeyConstants.username: username,
        JsonKeyConstants.email: emailId,
        JsonKeyConstants.inviteCode: inviteCode,
      };
}
