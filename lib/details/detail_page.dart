import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/details/detail_controller.dart';
import 'package:workout_app/home/home_controller.dart';
import 'package:workout_app/models/post_model.dart';
import 'package:workout_app/services/dio_service.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var detailController = Get.find<DetailController>();
    var homeController = Get.find<HomeController>();

    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController imgLinkController = TextEditingController();
    TextEditingController durationController = TextEditingController();
    TextEditingController caloriesController = TextEditingController();
    TextEditingController categoryController = TextEditingController();

    return Obx(
      () => Scaffold(
        body: detailController.isLoading.value
            ? Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Editing",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(CupertinoIcons.add),
                      onPressed: () {
                        Map<String, dynamic> data = {
                          'title': titleController.text,
                          'description': descriptionController.text,
                          'imgLink': imgLinkController.text,
                          'duration': durationController.text,
                          'calories': caloriesController.text,
                          'category': categoryController.text,
                        };
                        NetworkService.postData(
                            context,
                            data,
                            NetworkService.apiGetAllPosts,
                            NetworkService.paramEmpty());
                            homeController.postList.add(Post(id: '', title: titleController.text, description: descriptionController.text, imgLink: imgLinkController.text, duration: durationController.text, calories: caloriesController.text, category: categoryController.text));
                        Get.back();
                      },
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        maxLength: 25,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: "Title",
                            hintStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                      TextField(
                        controller: descriptionController,
                        maxLength: 25,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: "Description",
                            hintStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                      TextField(
                        controller: imgLinkController,
                        maxLength: 25,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: "Image Link",
                            hintStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                      TextField(
                        controller: durationController,
                        maxLength: 25,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: "Duration",
                            hintStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                      TextField(
                        controller: caloriesController,
                        maxLength: 25,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: "Calories",
                            hintStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                      TextField(
                        controller: categoryController,
                        maxLength: 25,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: "Category",
                            hintStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
