import 'package:get/get.dart';
import 'package:resono/controller/dashboardScreenController.dart';

class ViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardScreenController>(() => DashboardScreenController(), fenix: true);
  }
}