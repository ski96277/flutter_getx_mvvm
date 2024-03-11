import 'package:get/get.dart';
import 'package:resono/view/screens/initScreen/controller/initScreenController.dart';

class ViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitScreenController>(() => InitScreenController(), fenix: true);
  }
}