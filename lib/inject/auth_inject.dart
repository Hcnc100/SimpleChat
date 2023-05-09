import 'package:chat_app/data/auth/fire_auth_services.dart';
import 'package:chat_app/data/storage/fire_storage_services.dart';
import 'package:chat_app/data/user/fire_user_services.dart';
import 'package:chat_app/datasource/auth/local/auth_local_data_source.dart';
import 'package:chat_app/datasource/auth/local/auth_local_data_source_impl.dart';
import 'package:chat_app/datasource/auth/remote/auth_remote_data_source.dart';
import 'package:chat_app/datasource/auth/remote/auth_remote_data_source_impl.dart';
import 'package:chat_app/datasource/file_storage/remote/file_remote_data_source_impl.dart';
import 'package:chat_app/datasource/user/remote/user_remote_data_source.dart';
import 'package:chat_app/datasource/user/remote/user_remote_data_source_impl.dart';
import 'package:chat_app/domain/auth/auth_repository.dart';
import 'package:injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datasource/file_storage/remote/file_remote_data_souce.dart';
import '../domain/auth/auth_repo_impl.dart';

class AuthInject {
  static injectAll() async {
    await injectServices();
    await injectPreferences();
    await injectRemoteDataSources();
    await injectLocalDataSources();
    await injectFileRemoteDataSources();
    await injectUserRemoteDataSources();
    await injectFireStorageServices();
    await injectFireUserServices();
    await injectRepositories();
  }

  static injectServices() {
    Injector.appInstance.registerSingleton<FireAuthServices>(
        () => FireAuthServices());
  }

  static injectPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    Injector.appInstance.registerSingleton<SharedPreferences>(
        () => preferences);
  }

  static injectRemoteDataSources() {
    Injector.appInstance.registerSingleton<AuthRemoteDataSource>(
      () => FireAuthRemoteDataSourceImpl(
          authServices: Injector.appInstance.get<FireAuthServices>()),
    );
  }


  static injectLocalDataSources() {
    Injector.appInstance.registerSingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(
          sharedPreferences:  Injector.appInstance.get<SharedPreferences>()
      ),
    );
  }


  static injectFireStorageServices() {
    Injector.appInstance.registerSingleton<FireStorageServices>(
      () => FireStorageServices(),
    );
  }

  static injectFireUserServices() {
    Injector.appInstance.registerSingleton<FireUserServices>(
      () => FireUserServices(),
    );
  }


  static injectFileRemoteDataSources() {
    Injector.appInstance.registerSingleton<FileRemoteDataSource>(
      () => FileRemoteDataSourceImpl(
          fireStorage:  Injector.appInstance.get<FireStorageServices>()
      ),
    );
  }

  static injectUserRemoteDataSources() {
    Injector.appInstance.registerSingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(
          fireUserServices:  Injector.appInstance.get<FireUserServices>()
      ),
    );
  }


static injectRepositories() {
    Injector.appInstance.registerSingleton<AuthRepository>(
      () => AuthRepoImpl(
        authRemoteDataSource:
            Injector.appInstance.get<AuthRemoteDataSource>(),
        authLocalDataSource:
            Injector.appInstance.get<AuthLocalDataSource>(),
            fileRemoteDataSource:  Injector.appInstance.get<FileRemoteDataSource>(),
            userRemoteDataSource:  Injector.appInstance.get<UserRemoteDataSource>(),
      ),
    );
  }

}
