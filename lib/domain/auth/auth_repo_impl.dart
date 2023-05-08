
import 'package:chat_app/datasource/auth/local/auth_local_data_source.dart';
import 'package:chat_app/datasource/auth/remote/auth_remote_data_source.dart';
import 'package:chat_app/domain/auth/auth_repository.dart';

class AuthRepoImpl implements AuthRepository{

  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDatSource;
  
  AuthRepoImpl({required AuthRemoteDataSource authRemoteDataSource, required AuthLocalDataSource authLocalDataSource})
    : _authRemoteDataSource = authRemoteDataSource,
      _authLocalDatSource = authLocalDataSource;

  @override
  Future<void> login(String email, String password) async {
      final authData =await  _authRemoteDataSource.login(email, password);
      await _authLocalDatSource.saveAuthData(authData);
  }

  @override
  Future<void> logout()async {
    await  _authRemoteDataSource.logout();
    await _authLocalDatSource.clearAuthData();
  }

  @override
  Future<void> register(String email, String password) => _authRemoteDataSource.register(email, password);
  
  @override
  Future<bool> isLogged() async {
    final authData = await _authLocalDatSource.getAuthData();
    return authData != null;
  }

}