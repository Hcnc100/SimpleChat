

import 'package:chat_app/models/api/credentials_dto.dart';
import 'package:chat_app/models/auth_data/auth_data.dart';

abstract class AuthRemoteDataSource {
  Future<String> login(CredentialsDTO credentialsDTO);
  Future<void> logUp(CredentialsDTO credentialsDTO);
  Future<void> logout();
}