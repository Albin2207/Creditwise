import 'package:flutter/material.dart';
import '../../core/app_colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    // Add any initialization logic here
    await Future.delayed(const Duration(seconds: 2));
    
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.cardBackground,
                border: Border.all(color: AppColors.primaryBlue.withOpacity(0.3)),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: AppColors.primaryBlue.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/appbar/creditwiselogo.webp', 
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'CreditWise',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textT5,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: AppColors.primaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}