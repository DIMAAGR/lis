import 'package:flutter/material.dart';
import 'package:lis/src/modules/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:lis/src/modules/dashboard/presentation/widgets/search_button.dart';
import 'package:lis/src/modules/searcher/presentation/controllers/searcher_controller.dart';
import 'package:lis/src/modules/searcher/presentation/searcher_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.dashboardController, required this.searcherController});

  final DashboardController dashboardController;
  final SearcherController searcherController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF404040),
      floatingActionButton: SearcherButton(
        onTap: () => showDialog(
            context: context,
            builder: (context) {
              return SearcherPage(controller: searcherController);
            }),
      ),
    );
  }
}
