import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/login_page.dart';
import 'features/dashboard/dashboard_page.dart';
import 'features/dogs/dogs_page.dart';
import 'features/health/health_page.dart';
import 'features/rescue/rescue_page.dart';
import 'features/experts/experts_page.dart';
import 'features/profile/profile_page.dart';

class DogGuardApp extends StatelessWidget {
  const DogGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
        GoRoute(path: '/', builder: (_, __) => const DashboardPage()),
        GoRoute(path: '/dogs', builder: (_, __) => const DogsPage()),
        GoRoute(path: '/health', builder: (_, __) => const HealthPage()),
        GoRoute(path: '/rescue', builder: (_, __) => const RescuePage()),
        GoRoute(path: '/experts', builder: (_, __) => const ExpertsPage()),
        GoRoute(path: '/profile', builder: (_, __) => const ProfilePage()),
      ],
    );

    return MaterialApp.router(
      title: 'DogGuard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF087F5B),
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF7F9F8),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF22B889),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
