import 'package:get/get.dart';
import 'package:workout_app/home/home_controller.dart';

class HomeBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }

}