import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_diamensions.dart';
import 'scrollable_dial_widget.dart';

class EmiDialSection extends StatelessWidget {
  const EmiDialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacingL),
      child: Column(
        children: [
          // Title
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Number Of ',
                  style: TextStyle(
                    color: AppColors.textT6,
                   fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'EMIs',
                  style: TextStyle(
                    color: AppColors.ornage7,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppDimensions.spacingXXL),

          // Scrollable Dial
          const ScrollableDialWidget(),
        ],
      ),
    );
  }
}