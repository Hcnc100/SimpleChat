import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MessageData {
  String message;
  String ownerId;
  String ownerName;
  String ownerImage;
  DateTime createdAt;
  bool isMe;

  MessageData({
    required this.message,
    required this.ownerId,
    required this.ownerName,
    required this.ownerImage,
    this.isMe = true,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory MessageData.fromOnlyMessage(String message) => MessageData(
        message: message,
        ownerId: "123456",
        ownerName: "Juanito",
        ownerImage: "https://picsum.photos/200/300",
        createdAt: DateTime.now(),
        isMe: true,
      );

  Map<String, dynamic> toJsonFirebase() => {
        "message": message,
        "ownerId": ownerId,
        "ownerName": ownerName,
        "ownerImage": ownerImage,
        "createdAt": FieldValue.serverTimestamp(),
      };

  String get date {
    final inputFormat = DateFormat('dd/MM/yyyy HH:mm');
    final inputDate = inputFormat.format(createdAt);

    return inputDate;
  }

  factory MessageData.fromJsonFirebase({
    required Object? data,
    required bool isMe,
  }) {
    final json = data as Map<String, dynamic>;
    return MessageData(
      message: json["message"],
      ownerId: json["ownerId"],
      ownerName: json["ownerName"],
      ownerImage: json["ownerImage"],
      createdAt: json["createdAt"] != null
          ? (json["createdAt"] as Timestamp).toDate()
          : DateTime.now(),
      isMe: isMe,
    );
  }

  @override
  String toString() {
    return 'MessageData(message: $message, ownerId: $ownerId, ownerName: $ownerName, ownerImage: $ownerImage, createdAt: $createdAt, isMe: $isMe)';
  }
}
