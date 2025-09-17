import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_diamensions.dart';
import '../../../providers/banner_provider.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<BannerProvider>(
      builder: (context, bannerProvider, child) {
        switch (bannerProvider.state) {
          case BannerState.loading:
            return _buildLoadingState();
          case BannerState.error:
            return _buildErrorState(bannerProvider);
          case BannerState.loaded:
            return _buildCarouselWithIndicators(bannerProvider.banners);
          default:
            return _buildLoadingState();
        }
      },
    );
  }

  Widget _buildLoadingState() {
    return Container(
      height: AppDimensions.bannerHeight,
      margin: const EdgeInsets.all(AppDimensions.spacingM),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
      ),
      child: const Center(
        child: CircularProgressIndicator(color: AppColors.primaryBlue),
      ),
    );
  }

  Widget _buildErrorState(BannerProvider provider) {
    return Container(
      height: AppDimensions.bannerHeight,
      margin: const EdgeInsets.all(AppDimensions.spacingM),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: AppColors.error, size: 32),
            const SizedBox(height: 8),
            const Text(
              'Failed to load banners',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: provider.retry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
              ),
              child: const Text(
                'Retry',
                style: TextStyle(color: AppColors.textPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselWithIndicators(List banners) {
    if (banners.isEmpty) {
      return _buildLoadingState();
    }

    return Container(
      margin: const EdgeInsets.all(AppDimensions.spacingM),
      child: Column(
        children: [
          // Carousel
          SizedBox(
            height: AppDimensions.bannerHeight,
            child: CarouselSlider(
              options: CarouselOptions(
                height: AppDimensions.bannerHeight,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: banners.map((banner) => _buildBannerItem(banner)).toList(),
            ),
          ),
          const SizedBox(height: 12),
          // Page indicators
          _buildPageIndicators(banners.length),
        ],
      ),
    );
  }

  Widget _buildPageIndicators(int itemCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        bool isActive = index == _currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 6,
          width: isActive ? 20 : 6, // Active indicator is longer
          decoration: BoxDecoration(
            color:
                isActive
                    ? AppColors.primaryBlue
                    : AppColors.primaryBlue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }

  Widget _buildBannerItem(banner) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radiusL),
      child: CachedNetworkImage(
        imageUrl: banner.bannerImage,
        fit: BoxFit.cover,
        width: double.infinity,
        placeholder:
            (context, url) => Container(
              color: AppColors.cardBackground,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primaryBlue),
              ),
            ),
        errorWidget:
            (context, url, error) => Container(
              color: AppColors.cardBackground,
              child: const Center(
                child: Icon(Icons.error_outline, color: AppColors.error),
              ),
            ),
      ),
    );
  }
}
