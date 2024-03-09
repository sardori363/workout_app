import 'package:get/get.dart';
import 'package:workout_app/details/detail_controller.dart';

class DetailBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }

}