
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'package:islamic_app/screens/splash_screen.dart';
import 'package:islamic_app/services/notification_service.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

