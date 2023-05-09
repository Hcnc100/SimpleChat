import 'package:intl/intl.dart';

class MessageData {
  String message;
  String ownerId;
  String ownerName;
  String ownerImage;
  DateTime createdAt;

  MessageData({
    required this.message,
    required this.ownerId,
    required this.ownerName,
    required this.ownerImage,
    required this.createdAt,
  });

  factory MessageData.fromOnlyMessage(String message) => MessageData(
        message: message,
        ownerId: "123456",
        ownerName: "Juanito",
        ownerImage: "https://picsum.photos/200/300",
        createdAt: DateTime.now(),
      );

  factory MessageData.fromJson(Map<String, dynamic> json) => MessageData(
        message: json["message"],
        ownerId: json["ownerId"],
        ownerName: json["ownerName"],
        ownerImage: json["ownerImage"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  String get date {
    final inputFormat = DateFormat('dd/MM/yyyy HH:mm');
    final inputDate = inputFormat.format(createdAt);

    return inputDate;
  }
}
