import 'package:chat_app/ui/navigation/app_router.dart';
import 'package:chat_app/ui/screens/login_screen/login_screen.dart';
import 'package:chat_app/ui/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue),
      ),
      routerConfig: AppRouter.router,
    );
  }
}