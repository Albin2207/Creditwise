import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_diamensions.dart';

class BottomImageSection extends StatelessWidget {
  const BottomImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppDimensions.spacingM),
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        child: Image.asset(
          'assets/homeimage/Group 34847.png', 
          width: double.infinity,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
