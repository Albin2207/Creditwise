import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_diamensions.dart';
import '../../../../core/app_strings.dart';

class ServiceItem {
  final String title;
  final IconData icon;
  final Color color;

  ServiceItem({
    required this.title,
    required this.icon,
    required this.color,
  });
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static final List<ServiceItem> services = [
    ServiceItem(
      title: AppStrings.twoWheelerLoan,
      icon: Icons.motorcycle,
      color: AppColors.accentBlue,
    ),
    ServiceItem(
      title: AppStrings.personalLoan,
      icon: Icons.person,
      color: AppColors.accentGreen,
    ),
    ServiceItem(
      title: AppStrings.payEmis,
      icon: Icons.payment,
      color: AppColors.accentOrange,
    ),
    ServiceItem(
      title: AppStrings.creditScore,
      icon: Icons.score,
      color: AppColors.accentPurple,
    ),
    ServiceItem(
      title: AppStrings.bikeServicing,
      icon: Icons.build,
      color: AppColors.primaryRed,
    ),
    ServiceItem(
      title: AppStrings.eNach,
      icon: Icons.account_balance,
      color: AppColors.accentBlue,
    ),
    ServiceItem(
      title: AppStrings.quizAndGame,
      icon: Icons.quiz,
      color: AppColors.accentGreen,
    ),
    ServiceItem(
      title: AppStrings.evChargingLocation,
      icon: Icons.electric_bolt,
      color: AppColors.accentOrange,
    ),
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
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingM),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: AppDimensions.spacingM,
              mainAxisSpacing: AppDimensions.spacingM,
              childAspectRatio: 0.8,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return _buildServiceCard(service);
            },
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
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          border: Border.all(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: AppDimensions.iconL,
              height: AppDimensions.iconL,
              decoration: BoxDecoration(
                color: service.color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                service.icon,
                color: service.color,
                size: AppDimensions.iconM,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingS),
            Text(
              service.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}