import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_diamensions.dart';
import '../../common widgets/custom_nav_bar.dart';
import '../../common widgets/global_appbar.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_menusection.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentBottomNavIndex = 3; // Profile tab selected

  void _onBottomNavTap(int index) {
    setState(() {
      _currentBottomNavIndex = index;
    });

    // Handle navigation based on index
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: const GlobalAppBar(showProfileIcon: false, showBackButton: true),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            ProfileHeader(),

            SizedBox(height: AppDimensions.spacingL),

            // Profile Menu Section
            ProfileMenuSection(),

            SizedBox(height: AppDimensions.bottomNavHeight),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentBottomNavIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }
}
