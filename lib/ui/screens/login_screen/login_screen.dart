import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safePadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              const DecorationLogin(),
              Positioned(
                top: (size.height * 0.1 - 50) + safePadding,
                left: size.width * 0.5 - 50,
                child: const LogoApp(),
              ),
              Positioned(
                top: size.height * 0.35,
                left: size.width * 0.1,
                right: size.width * 0.1,
                child: const FormLogin(),
              ),
              const Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: RegisterSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





