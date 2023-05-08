import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
            const DecorationRegister(),
            Positioned(
              top: safePadding + 10,
              left: 0,
              child: const SectionTitle(),
            ),
            const Positioned(
              top: 180,
              left: 20,
              right: 20,
              child: FormRegister(),
            ),
          ],
              ),
            ),
        ));
  }
}




