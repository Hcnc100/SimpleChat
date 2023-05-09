

import 'package:chat_app/models/api/register_dto.dart';
import 'package:chat_app/models/auth_data/auth_data.dart';

abstract class UserRemoteDataSource{
    Future<void> addNewUser(RegisterDTO registerDTO);
    Future<void> updateUser(RegisterDTO registerDTO);
    Future<AuthData> getUser(String id);
}