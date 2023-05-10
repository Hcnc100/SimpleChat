
import 'package:flutter/material.dart';

class DecorationLogin extends StatelessWidget {
  const DecorationLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: _LoginPainter(
        theme.colorScheme.primary,
      ),
      child:  SizedBox.fromSize(
        size: size,
      ),
    );
  }
}

class _LoginPainter extends CustomPainter {
  final Color color;

  _LoginPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.35)
      ..quadraticBezierTo(
          0, size.height * 0.25, size.width * 0.2, size.height * 0.25)
      ..lineTo(size.width, size.height * 0.25)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_LoginPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_LoginPainter oldDelegate) => false;
}
