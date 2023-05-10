import 'package:chat_app/datasource/auth/local/auth_local_data_source.dart';
import 'package:chat_app/datasource/messages/messages_remote_data_source.dart';
import 'package:chat_app/domain/messages/message_repository.dart';
import 'package:chat_app/models/message_data.dart';

class MessageRepoImpl extends MessageRepository {
  final MessageRemoteDataSource _messageRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  MessageRepoImpl(
      {required MessageRemoteDataSource messageRemoteDataSource,
      required AuthLocalDataSource authLocalDataSource})
      : _messageRemoteDataSource = messageRemoteDataSource,
        _authLocalDataSource = authLocalDataSource;

  @override
  Future<void> addNewMessage(String message) async {
    final authData = await _authLocalDataSource.getAuthData();
    final messageData = MessageData(
        message: message,
        ownerId: authData!.id,
        ownerName: authData.nickName,
        ownerImage: authData.profileUrl,
        );

    await _messageRemoteDataSource.addNewMessage(messageData);
  }

  @override
  Future<Stream<List<MessageData>>> getMessages() async {
    final authData = await _authLocalDataSource.getAuthData();
    return _messageRemoteDataSource.getMessages(authData!.id);
  }
}
