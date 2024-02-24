import 'package:chatify/common/constants/json_key_constants.dart';

class UserRequestModel {
  final String? username;
  final String email;
  final String password;

  UserRequestModel({
    this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        JsonKeyConstants.username: username,
        JsonKeyConstants.email: email,
        JsonKeyConstants.password: password,
      };
}
