import 'package:flutter/material.dart';

class DashboardController extends ChangeNotifier {
  Future<void> navigateToSearcher(BuildContext context) async {
    await Navigator.of(context).pushNamed('/searcher');
  }
}
