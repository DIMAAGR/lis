import 'package:lis/src/modules/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:lis/src/modules/searcher/presentation/controllers/searcher_controller.dart';
import 'package:provider/provider.dart';

class AppProviders {
  List<ChangeNotifierProvider> call() => [
        ChangeNotifierProvider<DashboardController>(
          create: (ctx) => DashboardController(),
          lazy: true,
        ),
        ChangeNotifierProvider<SearcherController>(
          create: (ctx) => SearcherController(),
          lazy: true,
        ),
      ];
}
