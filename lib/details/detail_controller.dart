import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/services/dio_service.dart';

class DetailController extends GetxController {
  RxBool isLoading = true.obs;

  Future<bool> postData(BuildContext context,
      Map<String, dynamic> data, String api, Map<String, dynamic> param)async{

    var result = await NetworkService.postData(context, data, api, param);

    if(result != null){
      return true;
    } else{
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
