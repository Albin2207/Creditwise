import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../core/app_colors.dart';
import '../../../../core/app_diamensions.dart';

class ScrollableDialWidget extends StatefulWidget {
  const ScrollableDialWidget({super.key});

  @override
  State<ScrollableDialWidget> createState() => _ScrollableDialWidgetState();
}

class _ScrollableDialWidgetState extends State<ScrollableDialWidget> {
  double _currentAngle = 0; // Angle in radians, 0 is bottom center
  int _currentValue = 0;

  void _updateValueFromAngle() {
    // Convert angle to value (0-100)
    // Angle range: -π to 0 (semicircle from left to right)
    double normalizedAngle = _currentAngle + math.pi; // 0 to π
    int value = ((normalizedAngle / math.pi) * 100).round().clamp(0, 100);
    setState(() {
      _currentValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.dialSize + 50,
      height: AppDimensions.dialSize + 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Semi-circular track
          CustomPaint(
            size: Size(AppDimensions.dialSize, AppDimensions.dialSize),
            painter: SemiCircleTrackPainter(),
          ),

          // Draggable handle
          Positioned(
            left:
                (AppDimensions.dialSize + 50) / 2 +
                math.cos(_currentAngle) * (AppDimensions.dialSize / 2 - 20) -
                15,
            top:
                (AppDimensions.dialSize + 50) / 2 +
                math.sin(_currentAngle) * (AppDimensions.dialSize / 2 - 20) -
                15,
            child: GestureDetector(
              onPanUpdate: (details) {
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                Offset center = renderBox.size.center(Offset.zero);
                Offset localPosition = renderBox.globalToLocal(
                  details.globalPosition,
                );

                double angle = math.atan2(
                  localPosition.dy - center.dy,
                  localPosition.dx - center.dx,
                );

                // Constrain to semicircle (bottom half)
                if (angle > 0) {
                  angle = angle > math.pi / 2 ? math.pi : 0;
                }

                setState(() {
                  _currentAngle = angle;
                });
                _updateValueFromAngle();
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Center value display
          Positioned(
            bottom: 80,
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFF2E8B8B), // Teal color
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  _currentValue.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Up/Down arrows
          Positioned(
            bottom: 20,
            child: Column(
              children: [
                Icon(
                  Icons.keyboard_arrow_up,
                  color: AppColors.accentBlue,
                  size: 24,
                ),
                const SizedBox(height: 4),
                Container(width: 2, height: 20, color: AppColors.accentBlue),
                const SizedBox(height: 4),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.accentBlue,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SemiCircleTrackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2 - 20;

    // Draw outer gray arc
    final Paint trackPaint =
        Paint()
          ..color = const Color(0xFF6B7280) // Gray color
          ..strokeWidth = 60
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      math.pi, // Start from left
      math.pi, // Sweep 180 degrees
      false,
      trackPaint,
    );

    // Draw tick marks
    final Paint tickPaint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2;

    for (int i = 0; i <= 100; i += 10) {
      double angle = math.pi + (i / 100) * math.pi; // From π to 2π
      double tickRadius = radius - 15;
      double tickEndRadius = radius + 15;

      double startX = centerX + math.cos(angle) * tickRadius;
      double startY = centerY + math.sin(angle) * tickRadius;
      double endX = centerX + math.cos(angle) * tickEndRadius;
      double endY = centerY + math.sin(angle) * tickEndRadius;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);
    }

    // Draw numbers
    final TextStyle numberStyle = TextStyle(
      color: AppColors.accentBlue,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    // Draw 30, 60, 90 labels
    _drawNumberAtAngle(
      canvas,
      centerX,
      centerY,
      radius + 40,
      math.pi * 1.33,
      "30",
      numberStyle,
    );
    _drawNumberAtAngle(
      canvas,
      centerX,
      centerY,
      radius + 40,
      math.pi * 1.67,
      "60",
      numberStyle,
    );
    _drawNumberAtAngle(
      canvas,
      centerX,
      centerY,
      radius + 40,
      math.pi * 2,
      "90",
      numberStyle,
    );
  }

  void _drawNumberAtAngle(
    Canvas canvas,
    double centerX,
    double centerY,
    double radius,
    double angle,
    String text,
    TextStyle style,
  ) {
    double x = centerX + math.cos(angle) * radius;
    double y = centerY + math.sin(angle) * radius;

    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(x - textPainter.width / 2, y - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
