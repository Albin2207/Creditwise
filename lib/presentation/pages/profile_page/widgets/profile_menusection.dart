import 'package:flutter/material.dart';
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
        color: const Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
      ),
      child: const Column(
        children: [
          ProfileMenuItem(
            imageAsset: 'assets/profileset/Vector.png',
            title: AppStrings.profile,
            isFirst: true,
          ),
          ProfileMenuItem(
            imageAsset: 'assets/profileset/Group 1303.png',
            title: AppStrings.loanInfo,
          ),
          ProfileMenuItem(
            imageAsset: 'assets/profileset/Group 34397 (1).png',
            title: AppStrings.repayment,
          ),
          ProfileMenuItem(
            imageAsset: 'assets/profileset/Icon.png',
            title: AppStrings.bikeInfo,
          ),
          ProfileMenuItem(
            imageAsset: 'assets/profileset/Group.png',
            title: AppStrings.vehicleDocuments,
          ),
          ProfileMenuItem(
            imageAsset: 'assets/profileset/Group (1).png',
            title: AppStrings.registerMandate,
          ),
          ProfileMenuItem(
            imageAsset: 'assets/profileset/Group 1304.png',
            title: AppStrings.logout,
            isLast: true,
            isLogout: true,
          ),
        ],
      ),
    );
  }
}
