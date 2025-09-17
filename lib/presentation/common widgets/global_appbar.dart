import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_diamensions.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onProfileTap;
  final bool showUsername; // New parameter to control username display
  final String? username; // Username to display

  const GlobalAppBar({
    super.key,
    this.title,
    this.onProfileTap,
    this.showUsername = false, // Default to false (home screen behavior)
    this.username = 'Ayush', // Default username
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      automaticallyImplyLeading: false, // Never show automatic back button
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onProfileTap,
                child: Container(
                  width: AppDimensions.iconL,
                  height: AppDimensions.iconL,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/appbar/Group 34961.png',
                      width: AppDimensions.iconL,
                      height: AppDimensions.iconL,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: AppColors.primaryBlue,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              'Hi',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Hi,',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Show username only when showUsername is true
                  if (showUsername && username != null)
                    Text(
                      username!,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Center(
              child: SizedBox(
                height: 40,
                child: Image.asset(
                  'assets/appbar/Group 34130.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'LOGO',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: AppColors.textPrimary, size: 24),
          onPressed: () {
            // Handle settings/menu action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppDimensions.appBarHeight);
}
