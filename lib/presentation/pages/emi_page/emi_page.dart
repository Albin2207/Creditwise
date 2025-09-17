import 'package:flutter/material.dart';
import '../../../core/app_diamensions.dart';
import '../../common widgets/global_appbar.dart';
import 'widgets/emi_dial_section.dart';

class EmiScreen extends StatefulWidget {
  const EmiScreen({super.key});

  @override
  State<EmiScreen> createState() => _EmiScreenState();
}

class _EmiScreenState extends State<EmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: const GlobalAppBar(
        showUsername: true, 
        username: 'Ayush',
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppDimensions.spacingXXXL),

            // EMI Dial Section
            EmiDialSection(),

            SizedBox(height: AppDimensions.bottomNavHeight),
          ],
        ),
      ),
    );
  }
}
