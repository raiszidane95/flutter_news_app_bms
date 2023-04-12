import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import 'dto/authenticate_user.body.dart';
import 'dto/register_user.body.dart';

class AuthService {
  final dio = Dio();
  final storage = GetStorage();
  String get _prefix => 'http://8.222.220.65:8008/api/v1/user/login';
  String get _prefixReg => 'http://8.222.220.65:8008/api/v1/user/register';

  Future authenticateUser(
    AuthenticateUserBody body,
  ) async {
    final response = await dio.post(_prefix, data: body.toJson());

    return response.data;
  }

  Future registerUser(
    RegisterUserBody body,
  ) async {
    final response = await dio.post(_prefixReg, data: body.toJson());

    return response.data;
  }
}
