import 'package:flutter/material.dart';
import 'package:lis/src/modules/dashboard/presentation/dashboard_page.dart';
import 'package:provider/provider.dart';

abstract class AppRoutes {
  static const String main = '/';

  static Map<String, Widget Function(BuildContext)> get map => {
        main: (context) => DashboardPage(
              dashboardController: context.watch(),
              searcherController: context.watch(),
            ),
      };
}
