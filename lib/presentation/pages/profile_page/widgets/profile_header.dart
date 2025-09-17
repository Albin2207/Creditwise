import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_diamensions.dart';
import '../../../../core/app_strings.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacingL),
      child: Column(
        children: [
          // Profile Image
          Container(
            width: 150,
            height: 120,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                'assets/profileset/Group 34398.png',
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: AppDimensions.spacingM),

          // User Name
          const Text(
            AppStrings.ayushKhurana,
            style: TextStyle(
              color: AppColors.textT5,
              fontSize: AppDimensions.nameTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: AppDimensions.spacingXS),

          // Phone Number
          const Text(
            AppStrings.phoneNumber,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: AppDimensions.phoneTextSize,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
