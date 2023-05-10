import 'package:chat_app/data/messages/fire_message_services.dart';
import 'package:chat_app/datasource/auth/local/auth_local_data_source.dart';
import 'package:chat_app/datasource/messages/message_remote_data_source_impl.dart';
import 'package:chat_app/datasource/messages/messages_remote_data_source.dart';
import 'package:chat_app/domain/messages/message_repo_impl.dart';
import 'package:chat_app/domain/messages/message_repository.dart';
import 'package:injector/injector.dart';

class MessageInject {
  static injectAll() {
    injectMessageServices();
    injectMessageRemoteDataSource();
    injectRepositories();
  }

  static void injectMessageServices() {
    Injector.appInstance
        .registerSingleton<FireMessageServices>(() => FireMessageServices());
  }

  static void injectMessageRemoteDataSource() {
    Injector.appInstance.registerSingleton<MessageRemoteDataSource>(
      () => MessageRemoteDataSourceImpl(
        fireMessageServices: Injector.appInstance.get<FireMessageServices>(),
      ),
    );
  }

  static void injectRepositories() {
    Injector.appInstance.registerSingleton<MessageRepository>(
      () => MessageRepoImpl(
        messageRemoteDataSource:
            Injector.appInstance.get<MessageRemoteDataSource>(),
            authLocalDataSource:  Injector.appInstance.get<AuthLocalDataSource>()
      ),
    );
  }
}
