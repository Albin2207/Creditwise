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
            width: AppDimensions.profileImageSize,
            height: AppDimensions.profileImageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryBlue,
                width: 3,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.profileImageSize / 2),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    size: AppDimensions.iconXL,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: AppDimensions.spacingM),
          
          // User Name
          const Text(
            AppStrings.ayushKhurana,
            style: TextStyle(
              color: AppColors.textPrimary,
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
