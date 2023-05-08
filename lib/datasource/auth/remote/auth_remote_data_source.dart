

import 'package:chat_app/models/auth_data/auth_data.dart';

abstract class AuthRemoteDataSource {
  Future<AuthData> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
}