import 'package:flutter/material.dart';
import 'package:lis/src/core/routes/routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LIS',
      routes: AppRoutes.map,
    );
  }
}
