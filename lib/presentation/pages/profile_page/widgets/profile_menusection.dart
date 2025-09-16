import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_diamensions.dart';
import '../../../../core/app_strings.dart';
import 'profile_menuitems.dart';


class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.spacingM),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(
          color: AppColors.borderColor,
          width: 1,
        ),
      ),
      child: const Column(
        children: [
          ProfileMenuItem(
            icon: Icons.person_outline,
            title: AppStrings.profile,
            isFirst: true,
          ),
          ProfileMenuItem(
            icon: Icons.info_outline,
            title: AppStrings.loanInfo,
          ),
          ProfileMenuItem(
            icon: Icons.payment_outlined,
            title: AppStrings.repayment,
          ),
          ProfileMenuItem(
            icon: Icons.motorcycle_outlined,
            title: AppStrings.bikeInfo,
          ),
          ProfileMenuItem(
            icon: Icons.description_outlined,
            title: AppStrings.vehicleDocuments,
          ),
          ProfileMenuItem(
            icon: Icons.app_registration_outlined,
            title: AppStrings.registerMandate,
          ),
          ProfileMenuItem(
            icon: Icons.logout_outlined,
            title: AppStrings.logout,
            isLast: true,
            isLogout: true,
          ),
        ],
      ),
    );
  }
}