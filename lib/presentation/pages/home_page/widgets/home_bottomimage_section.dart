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
        border: Border.all(
          color: AppColors.borderColor,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryBlue.withOpacity(0.1),
                  AppColors.accentBlue.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            ),
          ),
          // Placeholder illustration
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Group of people/community illustration
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPersonAvatar(AppColors.primaryBlue),
                    const SizedBox(width: AppDimensions.spacingXS),
                    _buildPersonAvatar(AppColors.accentGreen),
                    const SizedBox(width: AppDimensions.spacingXS),
                    _buildPersonAvatar(AppColors.accentOrange),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacingS),
                // Community/connection illustration
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacingM,
                    vertical: AppDimensions.spacingXS,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceColor,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.groups,
                        color: AppColors.textSecondary,
                        size: 16,
                      ),
                      SizedBox(width: AppDimensions.spacingXS),
                      Text(
                        'Community',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonAvatar(Color color) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
        border: Border.all(
          color: color.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Icon(
        Icons.person,
        color: color,
        size: 18,
      ),
    );
  }
}