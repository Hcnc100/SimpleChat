

import 'package:chat_app/models/auth_data/auth_data.dart';

abstract class UserRemoteDataSource{
    Future<void> addNewUser(AuthData authData);
    Future<void> updateUser(AuthData authData);
    Future<AuthData> getUser(String id);
}