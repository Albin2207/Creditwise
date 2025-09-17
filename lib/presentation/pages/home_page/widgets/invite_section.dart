import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_diamensions.dart';
import '../../../../core/app_strings.dart';

class InviteSection extends StatelessWidget {
  const InviteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppDimensions.spacingM),
      padding: const EdgeInsets.all(AppDimensions.spacingL),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 19, 19, 19),
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  AppStrings.inviteYourFriends,
                  style: TextStyle(
                    color: AppColors.text4,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingS),
                const Text(
                  AppStrings.getUpto1000Coins,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppDimensions.spacingM),
                ElevatedButton(
                  onPressed: () {
                    // Handle invite action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.textT5,
                    foregroundColor: AppColors.textPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusS,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacingM,
                      vertical: AppDimensions.spacingXS,
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    AppStrings.sendInvite,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppDimensions.spacingM),
          _buildInviteIllustration(),
        ],
      ),
    );
  }

  Widget _buildInviteIllustration() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
      ),
      child: Image.asset(
        'assets/invitesection/Group 34978.png', 
        width: 80,
        height: 80,
        fit: BoxFit.contain,
      ),
    );
  }
}
