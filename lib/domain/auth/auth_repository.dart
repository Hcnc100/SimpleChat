


import 'package:chat_app/models/api/credentials_dto.dart';
import 'package:chat_app/models/api/register_dto.dart';
import 'package:chat_app/ui/screens/register_screen/view_model/register_state.dart';

abstract class AuthRepository {
  Future<void> login(CredentialsDTO credentialsDTO);
  Future<void> logUp(CredentialsDTO credentialsDTO);
  Future<void> createAccount(RegisterState registerState);
  Future<void> registerUser(RegisterDTO registerDTO);
  Future<void> logout();
  Future<bool> isLogged();
}