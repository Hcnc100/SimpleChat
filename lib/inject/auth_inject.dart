import 'package:chat_app/data/auth/firebase_auth.dart';
import 'package:chat_app/datasource/auth/local/auth_local_data_source.dart';
import 'package:chat_app/datasource/auth/local/auth_local_data_source_impl.dart';
import 'package:chat_app/datasource/auth/remote/auth_remote_data_source.dart';
import 'package:chat_app/datasource/auth/remote/auth_remote_data_source_impl.dart';
import 'package:chat_app/domain/auth/auth_repository.dart';
import 'package:injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/auth/auth_repo_impl.dart';

class AuthInject {
  static injectAll() async {
    await injectServices();
    await injectPreferences();
    await injectRemoteDataSources();
    await injectLocalDataSources();
    await injectRepositories();
  }

  static injectServices() {
    Injector.appInstance.registerSingleton<FirebaseAuthentication>(
        () => FirebaseAuthentication());
  }

  static injectPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    Injector.appInstance.registerSingleton<SharedPreferences>(
        () => preferences);
  }

  static injectRemoteDataSources() {
    Injector.appInstance.registerSingleton<AuthRemoteDataSource>(
      () => FireAuthRemoteDataSourceImpl(
          authServices: Injector.appInstance.get<FirebaseAuthentication>()),
    );
  }


  static injectLocalDataSources() {
    Injector.appInstance.registerSingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(
          sharedPreferences:  Injector.appInstance.get<SharedPreferences>()
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
      ),
    );
  }

}
