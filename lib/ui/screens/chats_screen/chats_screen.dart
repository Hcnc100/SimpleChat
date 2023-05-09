import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/widgets.dart';

class ChatsScreen extends ConsumerWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        actions: const [IconLogOut()],
      ),
      body: Column(
        children: const [
          ListMessages(),
          Divider(height: 1),
          InputMessage(),
        ],
      ),
    );
  }
}
