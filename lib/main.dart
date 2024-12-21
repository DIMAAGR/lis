import 'package:flutter/material.dart';
import 'package:lis/src/core/main/main_app.dart';
import 'package:lis/src/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: AppProviders()(),
      child: const MainApp(),
    ),
  );
}
