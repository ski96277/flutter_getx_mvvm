import 'package:get/get.dart';
import 'package:resono/screens/DashboardScreen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DashboardScreen,
      page: () => DashboardScreen(),
    ),

  ];
}
