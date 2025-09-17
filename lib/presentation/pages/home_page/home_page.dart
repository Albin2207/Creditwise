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

  Widget _buildDivider() {
    return Center(
      child: Container(width: 330, height: 1, color: AppColors.borderColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: GlobalAppBar(onProfileTap: _onProfileTap),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section with API data
            const BannerSection(),

            const SizedBox(height: AppDimensions.spacingL),
            _buildDivider(),
            const SizedBox(height: AppDimensions.spacingL),

            // Services Grid Section
            const ServicesSection(),

            const SizedBox(height: AppDimensions.spacingL),
            _buildDivider(),
            const SizedBox(height: AppDimensions.spacingL),

            // Invite Friends Section
            const InviteSection(),

            const SizedBox(height: AppDimensions.spacingM),
            _buildDivider(),
            const SizedBox(height: AppDimensions.spacingM),

            // Bottom Image Section
            const BottomImageSection(),

            const SizedBox(height: AppDimensions.bottomNavHeight),
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
