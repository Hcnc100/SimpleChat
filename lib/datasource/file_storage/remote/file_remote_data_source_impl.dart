

import 'package:chat_app/data/storage/fire_storage.dart';
import 'package:chat_app/datasource/file_storage/remote/file_remote_data_souce.dart';

class FileRemoteDataSourceImpl implements FileRemoteDataSource{
  final FireStorageServices _fireStorage;

  FileRemoteDataSourceImpl({required FireStorageServices fireStorage}) : _fireStorage = fireStorage;

  @override
  Future<String> uploadImage(String fileName, String filePath) => _fireStorage.uploadImage(fileName, filePath);

}