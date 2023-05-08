
import 'package:chat_app/models/auth_data/auth_data.dart';

abstract class AuthLocalDataSource{

      Future<void> saveAuthData(AuthData authData);

      Future<AuthData?> getAuthData();

      Future<void> clearAuthData();
}