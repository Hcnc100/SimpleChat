

import 'package:chat_app/ui/navigation/app_router.dart';
import 'package:chat_app/ui/screens/login_screen/view_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChatsScreen extends ConsumerWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        actions: const [ _IconLogOut() ],
      ),
      body: const Center(
        child: Text("Chats Screen"),
      ),
    );
  }
}

class _IconLogOut extends ConsumerWidget {
  const _IconLogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoginLoading =
        ref.watch(loginViewModel.select((value) => value.isLoading));
    
    if (isLoginLoading)  {
      return const CircularProgressIndicator();
    }

    return IconButton(
      onPressed: () {
        ref.read(loginViewModel.notifier).logout().then((value) => {
          context.go(AppRouter.login)
        });
      },
      icon: const Icon(Icons.logout),
    );
  }
}