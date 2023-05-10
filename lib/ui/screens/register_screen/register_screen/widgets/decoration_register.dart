
import 'package:flutter/material.dart';

class DecorationRegister extends StatelessWidget {
  const DecorationRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: _RegisterPainter(
        theme.colorScheme.primary,
      ),
      child:SizedBox.fromSize(size: size),
    );
  }
}

class _RegisterPainter extends CustomPainter {
  final Color color;

  _RegisterPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.25)
      ..quadraticBezierTo(
          0, size.height * 0.15, size.width * 0.2, size.height * 0.15)
      ..lineTo(size.width, size.height * 0.15)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_RegisterPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_RegisterPainter oldDelegate) => false;
}
