import 'package:chat_app/domain/auth/auth_repository.dart';
import 'package:chat_app/ui/screens/chats_screen/chats_screen.dart';
import 'package:chat_app/ui/screens/login_screen/login_screen.dart';
import 'package:chat_app/ui/screens/register_screen/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:injector/injector.dart';

class AppRouter {
  static const String login = '/login';
  static const String register = '/register';
  static const String chat = '/chat';

  static GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
        redirect: (context, state) async {
          final authRepository = Injector.appInstance.get<AuthRepository>();
          if (await authRepository.isLogged()) {
            return chat;
          }
          return null;
        },
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: chat,
        builder: (context, state) => const ChatsScreen(),
      ),
    ],
  );
}
