import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_diamensions.dart';
import '../../../../core/app_strings.dart';

class ProfileMenuItem extends StatelessWidget {
  final String imageAsset;
  final String title;
  final bool isFirst;
  final bool isLast;
  final bool isLogout;

  const ProfileMenuItem({
    super.key,
    required this.imageAsset,
    required this.title,
    this.isFirst = false,
    this.isLast = false,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Only navigate for Loan Info
        if (title == AppStrings.loanInfo) {
          Navigator.pushNamed(context, '/emi');
        }
        // Other menu items can be implemented later as needed
      },
      borderRadius: BorderRadius.vertical(
        top:
            isFirst
                ? const Radius.circular(AppDimensions.radiusM)
                : Radius.zero,
        bottom:
            isLast ? const Radius.circular(AppDimensions.radiusM) : Radius.zero,
      ),
      child: Container(
        height: AppDimensions.menuItemHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingM,
          vertical: AppDimensions.spacingS,
        ),
        decoration: BoxDecoration(
          border:
              !isLast
                  ? const Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 1,
                    ),
                  )
                  : null,
        ),
        child: Row(
          children: [
            Image.asset(
              imageAsset,
              width: AppDimensions.menuIconSize,
              height: AppDimensions.menuIconSize,
              color:
                  AppColors
                      .textSecondary, // Optional: apply color filter to maintain your theme
            ),
            const SizedBox(width: AppDimensions.spacingM),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
