import 'package:json_annotation/json_annotation.dart';

part 'register_user.body.g.dart';

@JsonSerializable()
class RegisterUserBody {
  String name;
  String email;
  String password;

  RegisterUserBody({
    required String name,
    required String email,
    required String password,
  })  : name = name.trim(),
        email = email.trim(),
        password = password.trim();

  factory RegisterUserBody.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateUserBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateUserBodyToJson(this);
}
