import 'package:chat_app/ui/navigation/app_router.dart';
import 'package:chat_app/ui/screens/login_screen/view_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IconLogOut extends ConsumerWidget {
  const IconLogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoginLoading =
        ref.watch(loginViewModel.select((value) => value.isLoading));
    
    if (isLoginLoading)  {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox.square(
          dimension: 15,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
          ),
      );
    }

    return IconButton(
      onPressed: () {
        ref.read(loginViewModel.notifier).logout(
          onSuccess: () => context.go(AppRouter.login),
        );
      },
      icon: const Icon(Icons.logout),
    );
  }
}