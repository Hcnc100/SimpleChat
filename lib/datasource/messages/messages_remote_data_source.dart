

import 'package:chat_app/models/message_data.dart';

abstract class MessageRemoteDataSource{
  Stream<List<MessageData>> getMessages(String id);
  Future<void> addNewMessage(MessageData messageData);
}