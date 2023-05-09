
import 'package:chat_app/data/auth/fire_auth_services.dart';
import 'package:chat_app/datasource/auth/remote/auth_remote_data_source.dart';
import 'package:chat_app/models/api/credentials_dto.dart';
import 'package:chat_app/models/auth_data/auth_data.dart';

class FireAuthRemoteDataSourceImpl  implements AuthRemoteDataSource {
  final FireAuthServices _authServices;

  FireAuthRemoteDataSourceImpl({ required FireAuthServices authServices})
      : _authServices = authServices;

  @override
  Future<String> login(CredentialsDTO credentialsDTO)  =>  _authServices.login(credentialsDTO);

  @override
  Future<void> logout() => _authServices.logout();

  @override
  Future<void> logUp(CredentialsDTO credentialsDTO) =>
      _authServices.register(credentialsDTO);
}
