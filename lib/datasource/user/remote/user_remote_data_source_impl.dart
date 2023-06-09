

import 'package:chat_app/data/user/fire_user_services.dart';
import 'package:chat_app/datasource/user/remote/user_remote_data_source.dart';
import 'package:chat_app/models/api/register_dto.dart';
import 'package:chat_app/models/auth_data/auth_data.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource{

  final FireUserServices _fireUserServices;

  UserRemoteDataSourceImpl({required FireUserServices fireUserServices}) : _fireUserServices = fireUserServices;

  @override
  Future<void> addNewUser(RegisterDTO registerDTO) => _fireUserServices.addUser(registerDTO);

  @override
  Future<AuthData> getUser(String id) => _fireUserServices.getUser(id);

  @override
  Future<void> updateUser(RegisterDTO registerDTO) => _fireUserServices.updateUser(registerDTO);

}