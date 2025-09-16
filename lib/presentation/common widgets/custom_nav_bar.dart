import 'package:creditwise_capital/core/app_strings.dart' show AppStrings;
import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_diamensions.dart';

class BottomNavItem {
  final String label;
  final IconData icon;

  BottomNavItem({required this.label, required this.icon});
}

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static final List<BottomNavItem> items = [
    BottomNavItem(label: AppStrings.home, icon: Icons.home),
    BottomNavItem(label: AppStrings.explore, icon: Icons.search),
    BottomNavItem(label: AppStrings.nitroCard, icon: Icons.credit_card),
    BottomNavItem(label: AppStrings.rewards, icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.bottomNavHeight,
      decoration: const BoxDecoration(
        color: AppColors.backgroundDark,
        border: Border(
          top: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = currentIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.spacingS,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected
                          ? AppColors.primaryBlue
                          : AppColors.textTertiary,
                      size: AppDimensions.iconM,
                    ),
                    const SizedBox(height: AppDimensions.spacingXS),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.primaryBlue
                            : AppColors.textTertiary,
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}