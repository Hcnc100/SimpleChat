import 'package:chat_app/models/message_data.dart';
import 'package:chat_app/ui/screens/chats_screen/view_model/chats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListMessages extends ConsumerWidget {
  const ListMessages({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages =
        ref.watch(chatsViewModel.select((value) => value.messages));

    if (messages.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text("No messages"),
        ),
      );
    }

    return Expanded(
        child: ListView.builder(
      controller: ref.read(chatsViewModel.notifier).scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) => ItemMessage(message: messages[index]),
    ));
  }
}

class ItemMessage extends StatelessWidget {
  final MessageData message;
  const ItemMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(message.ownerImage),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message.ownerName,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(message.message),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                message.date,
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
