import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_diamensions.dart';
import '../../../providers/banner_provider.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

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
            return _buildCarousel(bannerProvider.banners);
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

  Widget _buildCarousel(List banners) {
    if (banners.isEmpty) {
      return _buildLoadingState();
    }

    return Container(
      height: AppDimensions.bannerHeight,
      margin: const EdgeInsets.all(AppDimensions.spacingM),
      child: CarouselSlider(
        options: CarouselOptions(
          height: AppDimensions.bannerHeight,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          viewportFraction: 1.0,
        ),
        items: banners.map((banner) => _buildBannerItem(banner)).toList(),
      ),
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
