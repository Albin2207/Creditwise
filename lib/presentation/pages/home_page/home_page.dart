import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_diamensions.dart';
import '../../common widgets/custom_nav_bar.dart';
import '../../common widgets/global_appbar.dart';
import '../../providers/banner_provider.dart';
import 'widgets/banner_section.dart';
import 'widgets/home_bottomimage_section.dart';
import 'widgets/invite_section.dart';
import 'widgets/services_section.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentBottomNavIndex = 0;

  @override
  void initState() {
    super.initState();
    // Load banners when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BannerProvider>().loadBanners();
    });
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentBottomNavIndex = index;
    });
  }

  void _onProfileTap() {
    // Navigate to profile screen
    Navigator.pushNamed(context, '/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: GlobalAppBar(
        showProfileIcon: true,
        onProfileTap: _onProfileTap,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section with API data
            BannerSection(),
            
            SizedBox(height: AppDimensions.spacingL),
            
            // Services Grid Section
            ServicesSection(),
            
            SizedBox(height: AppDimensions.spacingL),
            
            // Invite Friends Section
            InviteSection(),
            
            SizedBox(height: AppDimensions.spacingM),
            
            // Bottom Image Section
            BottomImageSection(),
            
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