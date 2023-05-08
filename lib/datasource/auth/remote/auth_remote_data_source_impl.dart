import 'package:chat_app/data/auth/firebase_auth.dart';
import 'package:chat_app/datasource/auth/remote/auth_remote_data_source.dart';
import 'package:chat_app/models/auth_data/auth_data.dart';

class FireAuthRemoteDataSourceImpl  implements AuthRemoteDataSource {
  final FirebaseAuthentication _authServices;

  FireAuthRemoteDataSourceImpl({ required FirebaseAuthentication authServices})
      : _authServices = authServices;

  @override
  Future<AuthData> login(String email, String password) async {
    final user = await _authServices.login(email, password);
    return AuthData(
      email: user.user!.email!,
      id: user.user!.uid,
    );
  }
  @override
  Future<void> logout() => _authServices.logout();

  @override
  Future<void> register(String email, String password) =>
      _authServices.register(email, password);
}
