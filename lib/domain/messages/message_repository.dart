
import 'package:chat_app/models/message_data.dart';

abstract class MessageRepository{
  Future<Stream<List<MessageData>>> getMessages();
  Future<void> addNewMessage(String message);
}