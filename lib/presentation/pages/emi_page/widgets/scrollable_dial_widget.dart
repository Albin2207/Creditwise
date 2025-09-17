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
  double _currentAngle = math.pi * 0.75; // Start at bottom-left (135°)
  int _currentValue = 0;

  void _updateValueFromAngle() {
    // Convert angle to value (0-99)
    // Angle range: 135° to -45° (bottom-left to bottom-right, 270°)
    double startAngle = math.pi * 0.75; // 135° (bottom-left)
// -45° (bottom-right)

    // Calculate progress from start angle
    double normalizedAngle = _currentAngle;
    if (normalizedAngle < 0) {
      normalizedAngle += 2 * math.pi;
    }

    double progress;
    if (normalizedAngle >= startAngle) {
      // From 135° to 360°
      progress = (normalizedAngle - startAngle) / (math.pi * 1.5);
    } else {
      // From 0° to -45° (or 315°)
      progress = (normalizedAngle + 2 * math.pi - startAngle) / (math.pi * 1.5);
    }

    int value = (progress * 99).round().clamp(0, 99);
    setState(() {
      _currentValue = value;
    });
  }

  void _incrementValue() {
    if (_currentValue < 99) {
      setState(() {
        _currentValue++;
        double progress = _currentValue / 99;
        double totalAngle = math.pi * 1.5; // 270°
        _currentAngle = math.pi * 0.75 + progress * totalAngle;

        // Normalize to [-π, π]
        if (_currentAngle > math.pi) {
          _currentAngle -= 2 * math.pi;
        }
      });
    }
  }

  void _decrementValue() {
    if (_currentValue > 0) {
      setState(() {
        _currentValue--;
        double progress = _currentValue / 99;
        double totalAngle = math.pi * 1.5; // 270°
        _currentAngle = math.pi * 0.75 + progress * totalAngle;

        // Normalize to [-π, π]
        if (_currentAngle > math.pi) {
          _currentAngle -= 2 * math.pi;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                20,
            top:
                (AppDimensions.dialSize + 50) / 2 +
                math.sin(_currentAngle) * (AppDimensions.dialSize / 2 - 20) -
                20,
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

                // Constrain to the 270° arc (bottom-left to bottom-right)
                double startAngle = math.pi * 0.75; // 135° (bottom-left)
                double endAngle = -math.pi * 0.25; // -45° (bottom-right)

                // Handle angle wrapping and constraints
                if (angle > startAngle && angle < math.pi) {
                  angle = startAngle;
                } else if (angle < endAngle && angle > -math.pi) {
                  angle = endAngle;
                } else if (angle > 0 && angle < startAngle) {
                  // Determine which end is closer
                  double distToStart = math.min(
                    (startAngle - angle).abs(),
                    (startAngle - angle + 2 * math.pi).abs(),
                  );
                  double distToEnd = math.min(
                    (endAngle - angle).abs(),
                    (endAngle - angle + 2 * math.pi).abs(),
                  );
                  angle = distToStart < distToEnd ? startAngle : endAngle;
                }

                setState(() {
                  _currentAngle = angle;
                });
                _updateValueFromAngle();
              },
              child: Container(
                width: 40,
                height: 40,
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

          // Gap controls instead of up/down arrows
          Positioned(
            bottom: 20,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Increment button (up arrow) - increases value
                GestureDetector(
                  onTap: _incrementValue,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColors.accentBlue,
                      size: 24,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Vertical separator line
                Container(width: 2, height: 30, color: AppColors.accentBlue),

                const SizedBox(width: 8),

                // Decrement button (down arrow) - decreases value
                GestureDetector(
                  onTap: _decrementValue,
                  child: SizedBox(
                    width: 40,
                    height: 40,

                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.accentBlue,
                      size: 24,
                    ),
                  ),
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
      math.pi * 0.75, // Start from bottom-left (135°)
      math.pi * 1.5, // Sweep 270° clockwise
      false,
      trackPaint,
    );

    // Draw tick marks - BETWEEN the track and center circle
    final Paint tickPaint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2;

    // Draw tick marks in the space between arc and center circle
    for (int i = 0; i <= 54; i++) {
      // 54 ticks for 270°
      double angle = math.pi * 0.75 + (i / 54) * math.pi * 1.5;
      double tickInnerRadius = radius - 55; // Further from the arc
      double tickOuterRadius = radius - 40; // Don't touch the arc

      double startX = centerX + math.cos(angle) * tickInnerRadius;
      double startY = centerY + math.sin(angle) * tickInnerRadius;
      double endX = centerX + math.cos(angle) * tickOuterRadius;
      double endY = centerY + math.sin(angle) * tickOuterRadius;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);
    }

    // Draw numbers - Updated for correct left-to-right progression
    final TextStyle numberStyle = TextStyle(
      color: AppColors.accentBlue,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    // Numbers positioned correctly: 30 on left, 60 at bottom, 90 on right
    _drawNumberAtAngle(
      canvas,
      centerX,
      centerY,
      radius + 40,
      math.pi, // 180° (left side)
      "30",
      numberStyle,
    );
    _drawNumberAtAngle(
      canvas,
      centerX,
      centerY,
      radius + 40,
      math.pi * 1.5, // 270° (bottom)
      "60",
      numberStyle,
    );
    _drawNumberAtAngle(
      canvas,
      centerX,
      centerY,
      radius + 40,
      0, // 0° (right side)
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
