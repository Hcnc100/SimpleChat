import 'package:chat_app/models/message_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireMessageServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final CollectionReference _messageCollection =
      FirebaseFirestore.instance.collection("messages");

  Future<void> addNewMessage(MessageData messageData) async {
    await _messageCollection.add(messageData.toJsonFirebase());
  }

  Stream<List<MessageData>> getMessages(String id) {
    final  messageStream =
        _messageCollection.orderBy("createdAt", descending: true).snapshots().map((event) => event.docs
        .map((e) => MessageData.fromJsonFirebase(
              data: e.data(),
              isMe: e.id == id,
            ))
        .toList());

    return messageStream;
  }
}
