import 'package:chat_app/datasource/auth/local/auth_local_data_source.dart';
import 'package:chat_app/datasource/auth/remote/auth_remote_data_source.dart';
import 'package:chat_app/datasource/file_storage/remote/file_remote_data_souce.dart';
import 'package:chat_app/datasource/user/remote/user_remote_data_source.dart';
import 'package:chat_app/domain/auth/auth_repository.dart';
import 'package:chat_app/models/api/credentials_dto.dart';
import 'package:chat_app/models/api/register_dto.dart';
import 'package:chat_app/models/auth_data/auth_data.dart';
import 'package:chat_app/ui/screens/register_screen/view_model/register_state.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDatSource;
  final FileRemoteDataSource _fileRemoteDataSource;
  final UserRemoteDataSource _userRemoteDataSource;

  AuthRepoImpl({
    required AuthRemoteDataSource authRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
    required FileRemoteDataSource fileRemoteDataSource,
    required UserRemoteDataSource userRemoteDataSource,
  })  : _authRemoteDataSource = authRemoteDataSource,
        _authLocalDatSource = authLocalDataSource,
        _fileRemoteDataSource = fileRemoteDataSource,
        _userRemoteDataSource = userRemoteDataSource;

  @override
  Future<void> login(
    CredentialsDTO credentialsDTO,
  ) async {
    final id = await _authRemoteDataSource.login(credentialsDTO);
    final userData = await _userRemoteDataSource.getUser(id);
    await _authLocalDatSource.saveAuthData(userData);
  }

  @override
  Future<void> logout() async {
    await _authRemoteDataSource.logout();
    await _authLocalDatSource.clearAuthData();
  }

  @override
  Future<bool> isLogged() async {
    final authData = await _authLocalDatSource.getAuthData();
    return authData != null;
  }

  @override
  Future<void> logUp(CredentialsDTO credentialsDTO) =>
      _authRemoteDataSource.logUp(credentialsDTO);

  @override
  Future<void> registerUser(RegisterDTO registerDTO) =>
      _userRemoteDataSource.addNewUser(registerDTO);

  @override
  Future<void> createAccount(RegisterState registerState) async {
    await _authRemoteDataSource.logUp(
      CredentialsDTO.fromRegisterState(registerState),
    );
    final idUser = await _authRemoteDataSource.login(
      CredentialsDTO.fromRegisterState(registerState),
    );

    final imageUrl = await _fileRemoteDataSource.uploadImage(
      fileName: "$idUser.jpg",
      filePath: registerState.imageProfile!.path,
    );

    final registerDTO = RegisterDTO(
      id: idUser,
      email: registerState.email,
      nickName: registerState.nickName,
      profileUrl: imageUrl,
    );

    await _userRemoteDataSource.addNewUser(registerDTO);

    await _authLocalDatSource.saveAuthData(
      AuthData(
        id: idUser,
        email: registerState.email,
        nickName: registerState.nickName,
        profileUrl: imageUrl,
      ),
    );
  }
}
