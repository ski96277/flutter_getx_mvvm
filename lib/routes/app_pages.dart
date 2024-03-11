import 'package:get/get.dart';
import 'package:resono/view/screens/initScreen/init_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.initRoute,
      page: () => InitScreen(),
    ),

  ];
}
