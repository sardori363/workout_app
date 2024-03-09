import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:workout_app/models/post_model.dart';
import 'package:workout_app/services/dio_service.dart';

class HomeController extends GetxController{


  TextEditingController controller = TextEditingController();

  RxList<Post> postList = <Post>[].obs;
  RxList<Post> filteredByCatPosts = <Post>[].obs;

  RxBool isLoading = false.obs;
  RxInt activeBtn = (-1).obs;

  Future<void> fetchData()async{
    isLoading.value = false;
    var result = await NetworkService.getData(NetworkService.apiGetAllPosts, NetworkService.paramEmpty());
    if(result != null){
      postList.value = NetworkService.parsePostList(result);
      isLoading.value = true;
    }
  }

  Future<void> fetchBeginnerData()async{
    isLoading.value = false;
    var result = await NetworkService.getData(NetworkService.apiGetAllPosts, NetworkService.paramBeginnerCat());
    if(result != null){
      filteredByCatPosts.value = NetworkService.parsePostList(result);
      isLoading.value = true;
    }
  }

    Future<void> fetchInterData()async{
    isLoading.value = false;
    var result = await NetworkService.getData(NetworkService.apiGetAllPosts, NetworkService.paramInterCat());
    if(result != null){
      filteredByCatPosts.value = NetworkService.parsePostList(result);
      isLoading.value = true;
    }
  }

    Future<void> fetchAdvancedData()async{
    isLoading.value = false;
    var result = await NetworkService.getData(NetworkService.apiGetAllPosts, NetworkService.paramAdvancedCat());
    if(result != null){
      filteredByCatPosts.value = NetworkService.parsePostList(result);
      isLoading.value = true;
    }
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

}