import 'package:flutter/material.dart';

class HydraLogo extends StatelessWidget {
  final double size;
  final Color color;

  const HydraLogo({
    super.key,
    this.size = 72.0,
    this.color = const Color(0xFF38BDF8),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _HydraLogoPainter(color: color),
    );
  }
}

class _HydraLogoPainter extends CustomPainter {
  final Color color;

  _HydraLogoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Optional subtle stroke to soften and round the corners
    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final double cx = size.width / 2;
    final double cy = size.height / 2;

    // Geometric constants based on the module logo
    final double rOuter = size.width * 0.46; // Distance to outer tip
    final double mCorner = size.width * 0.20; // Corner width
    final double rInner = 0.0; // set to 0 so the logo fills fully without a hole in the middle
    final double gap = size.width * 0.035; // Gap between segments

    for (int i = 0; i < 4; i++) {
      canvas.save();
      canvas.translate(cx, cy);
      // 0 = Top, 1 = Right, 2 = Bottom, 3 = Left
      canvas.rotate(i * 1.5707963267948966); // 90 degrees in radians
      canvas.translate(0, -gap);

      final path = Path();
      // Outer tip
      path.moveTo(0, -rOuter);
      // Right wing corner
      path.lineTo(mCorner, -mCorner);
      // Center notch
      path.lineTo(0, -rInner);
      // Left wing corner
      path.lineTo(-mCorner, -mCorner);
      path.close();

      canvas.drawPath(path, paint);
      canvas.drawPath(path, strokePaint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _HydraLogoPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

