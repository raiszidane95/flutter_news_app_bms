// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserBody _$AuthenticateUserBodyFromJson(Map<String, dynamic> json) {
  return RegisterUserBody(
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$AuthenticateUserBodyToJson(RegisterUserBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
