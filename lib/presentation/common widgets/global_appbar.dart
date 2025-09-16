import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_diamensions.dart';
import '../../core/app_strings.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showProfileIcon;
  final VoidCallback? onProfileTap;
  final bool showBackButton;

  const GlobalAppBar({
    super.key,
    this.title,
    this.showProfileIcon = true,
    this.onProfileTap,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.textPrimary,
                size: AppDimensions.iconM,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (!showBackButton)
            Container(
              width: AppDimensions.iconL,
              height: AppDimensions.iconL,
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'Hi',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          const SizedBox(width: AppDimensions.spacingS),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: AppColors.primaryRed,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: AppColors.textPrimary,
                  size: 16,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingXS),
              const Text(
                AppStrings.creditWiseCapital,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        if (showProfileIcon)
          GestureDetector(
            onTap: onProfileTap,
            child: Container(
              margin: const EdgeInsets.only(right: AppDimensions.spacingM),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primaryBlue,
                child: const Text(
                  'Hi',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        if (!showProfileIcon)
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: AppColors.textPrimary,
            ),
            onPressed: () {
              // Handle menu action
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppDimensions.appBarHeight);
}