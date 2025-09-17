import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_diamensions.dart';

class BottomNavItem {
  final String activeImage;
  final String inactiveImage;

  BottomNavItem({required this.activeImage, required this.inactiveImage});
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
    BottomNavItem(
      activeImage: 'assets/navbar/Group 34173.png',
      inactiveImage: 'assets/navbar/Group 34173.png',
    ),
    BottomNavItem(
      activeImage: 'assets/navbar/Group 34546.png',
      inactiveImage: 'assets/navbar/Group 34546.png',
    ),
    BottomNavItem(
      activeImage: 'assets/navbar/Group 1236.png',
      inactiveImage: 'assets/navbar/Group 1236.png',
    ),
    BottomNavItem(
      activeImage: 'assets/navbar/Group 34547.png',
      inactiveImage: 'assets/navbar/Group 34547.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.bottomNavHeight,
      decoration: const BoxDecoration(
        color: AppColors.backgroundDark,
        border: Border(top: BorderSide(color: AppColors.borderColor, width: 1)),
      ),
      child: Row(
        children:
            items.asMap().entries.map((entry) {
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
                        Image.asset(
                          isSelected ? item.activeImage : item.inactiveImage,
                          width: AppDimensions.iconL,
                          height: AppDimensions.iconL,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: AppDimensions.spacingXS),
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
