import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_diamensions.dart';
import '../../common widgets/custom_nav_bar.dart';
import '../../common widgets/global_appbar.dart';
import 'widgets/emi_dial_section.dart';

class EmiScreen extends StatefulWidget {
  const EmiScreen({super.key});

  @override
  State<EmiScreen> createState() => _EmiScreenState();
}

class _EmiScreenState extends State<EmiScreen> {
  int _currentBottomNavIndex = 0;

  void _onBottomNavTap(int index) {
    setState(() {
      _currentBottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: const GlobalAppBar(
        showProfileIcon: false,
        showBackButton: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppDimensions.spacingXL),
            
            // EMI Dial Section
            EmiDialSection(),
            
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