import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_diamensions.dart';
import '../../../../core/app_strings.dart';

class ServiceItem {
  final String imagePath;

  ServiceItem({required this.imagePath});
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static final List<ServiceItem> services = [
    ServiceItem(imagePath: 'assets/services/Frame 1582.png'),
    ServiceItem(imagePath: 'assets/services/Group 34841.png'),
    ServiceItem(imagePath: 'assets/services/Group 35050.png'),
    ServiceItem(imagePath: 'assets/services/Group 35051.png'),
    ServiceItem(imagePath: 'assets/services/Group 35048.png'),
    ServiceItem(imagePath: 'assets/services/Group 35047.png'),
    ServiceItem(imagePath: 'assets/services/Group 35046.png'),
    ServiceItem(imagePath: 'assets/services/Group 35049.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.services,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingM),
          Wrap(
            spacing: AppDimensions.spacingM,
            runSpacing: AppDimensions.spacingM,
            children:
                services.map((service) => _buildServiceCard(service)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(ServiceItem service) {
    return GestureDetector(
      onTap: () {
        // Handle service tap
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            service.imagePath,
            width: AppDimensions.iconXL,
            height: AppDimensions.iconXL,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: AppDimensions.spacingS),
        ],
      ),
    );
  }
}
