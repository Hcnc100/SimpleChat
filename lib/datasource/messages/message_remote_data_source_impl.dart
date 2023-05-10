
import 'package:chat_app/data/messages/fire_message_services.dart';
import 'package:chat_app/datasource/messages/messages_remote_data_source.dart';
import 'package:chat_app/models/message_data.dart';

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource{

  final FireMessageServices _fireMessageServices;

  MessageRemoteDataSourceImpl({required FireMessageServices fireMessageServices}) : _fireMessageServices = fireMessageServices;

  @override
  Future<void> addNewMessage(MessageData messageData) =>
      _fireMessageServices.addNewMessage(messageData);

  @override
  Stream<List<MessageData>> getMessages(String id) =>
      _fireMessageServices.getMessages(id);

}