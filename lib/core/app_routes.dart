import 'package:flutter/material.dart';
import '../presentation/pages/home_page/home_page.dart';
import '../presentation/pages/profile_page/profile_page.dart';
import '../presentation/pages/emi_page/emi_page.dart';
import '../presentation/splash_page/splash_page.dart';


class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String emi = '/emi';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
    profile: (context) => const ProfileScreen(),
    emi: (context) => const EmiScreen(),
  };
}