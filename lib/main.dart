import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/app_colors.dart';
import 'core/app_routes.dart';
import 'dependency_injection_container.dart' as di;
import 'presentation/providers/banner_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const CreditWiseApp());
}

class CreditWiseApp extends StatelessWidget {
  const CreditWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BannerProvider>(
          create:
              (_) =>
                  di.sl<BannerProvider>()..loadBanners(), // Auto-load banners
        ),
      ],
      child: MaterialApp(
        title: 'CreditWise',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundDark,
          primaryColor: AppColors.primaryBlue,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.backgroundDark,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors.textPrimary),
            titleTextStyle: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.routes,
      ),
    );
  }
}
