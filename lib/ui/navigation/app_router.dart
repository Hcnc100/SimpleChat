

import 'package:chat_app/ui/screens/login_screen/login_screen.dart';
import 'package:chat_app/ui/screens/register_screen/register_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter{
    static const String home = '/';
    static const String login = '/login';
    static const String register = '/register';



    static GoRouter  router = GoRouter(
        routes: [
            GoRoute(
                path: home,
                builder: (context, state) => const LoginScreen(),
            ),
            GoRoute(
                path: login,
                builder: (context, state) => const LoginScreen(),
            ),
            GoRoute(
                path: register,
                builder: (context, state) => const RegisterScreen(),
            ),
        ],
    ); 

}