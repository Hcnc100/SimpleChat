import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safePadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const DecorationRegister(),
            SizedBox(
              width: size.width,
              height: 820,
            ),
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
    );
  }
}




