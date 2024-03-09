import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomeController>();

    return Obx(
      () => Scaffold(
        body: homeController.isLoading.value
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(30),
                        child: Column(
                          /// header
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hello Sam",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Let's start your day",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/details');
                                      },
                                      child: Image.network(
                                      'https://i.pinimg.com/originals/ca/7e/69/ca7e698a1cc7ae49086694030c19ac41.png',
                                      fit: BoxFit.cover,
                                      width: 60,
                                      height: 60,
                                    ),
                                    )
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            /// favourite workouts
                            Container(
                              height: 400,
                              child: ListView.builder(
                                // shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: homeController.postList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 330,
                                    height: 400,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            homeController
                                                .postList[index].imgLink,
                                            fit: BoxFit.cover,
                                            width: 330,
                                            height: 400,
                                          ),
                                        ),
                                        Positioned(
                                            top: 10,
                                            left: 10,
                                            child: Text(
                                              homeController
                                                  .postList[index].title,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Positioned(
                                            top: 50,
                                            left: 10,
                                            child: Text(
                                              homeController
                                                  .postList[index].title,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            )),
                                        Positioned(
                                          bottom: 15,
                                          left: 15,
                                          child: Container(
                                            width: 80,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color.fromARGB(
                                                    199, 255, 255, 255)),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.play_arrow,
                                                  color: Color.fromARGB(
                                                      255, 19, 43, 53),
                                                ),
                                                Text(
                                                  homeController
                                                      .postList[index].duration,
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 19, 43, 53),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 15,
                                          left: 105,
                                          child: Container(
                                            width: 90,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    199, 255, 255, 255)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Image.asset(
                                                    'assets/ios_fire-removebg-preview.png'),
                                                Text(
                                                  homeController
                                                      .postList[index].calories,
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 19, 43, 53),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),

                            /// category
                            Container(
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Workout Categories",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "See All",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFF2F80ED)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          homeController.activeBtn.value = 1;
                                          homeController.fetchBeginnerData();
                                        },
                                        color:
                                            homeController.activeBtn.value == 1
                                                ? const Color(0xFF132B35)
                                                : Colors.white,
                                        child: Text(
                                          "Beginner",
                                          style: TextStyle(
                                              color: homeController
                                                          .activeBtn.value ==
                                                      1
                                                  ? Colors.white
                                                  : Color(0xFF132B35)),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          homeController.activeBtn.value = 2;
                                          homeController.fetchInterData();
                                        },
                                        color:
                                            homeController.activeBtn.value == 2
                                                ? const Color(0xFF132B35)
                                                : Colors.white,
                                        child: Text(
                                          "Intermediate",
                                          style: TextStyle(
                                              color: homeController
                                                          .activeBtn.value ==
                                                      2
                                                  ? Colors.white
                                                  : Color(0xFF132B35)),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          homeController.activeBtn.value = 3;
                                          homeController.fetchAdvancedData();
                                        },
                                        color:
                                            homeController.activeBtn.value == 3
                                                ? const Color(0xFF132B35)
                                                : Colors.white,
                                        child: Text(
                                          "Advanced",
                                          style: TextStyle(
                                              color: homeController
                                                          .activeBtn.value ==
                                                      3
                                                  ? Colors.white
                                                  : Color(0xFF132B35)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            /// filtered
                            Container(
                              height: 400,
                              child: ListView.builder(
                                // shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    homeController.filteredByCatPosts.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, bottom: 10),
                                    width: 330,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            homeController
                                                .filteredByCatPosts[index]
                                                .imgLink,
                                            fit: BoxFit.cover,
                                            width: 330,
                                            height: 300,
                                          ),
                                        ),
                                        Positioned(
                                            top: 10,
                                            left: 10,
                                            child: Text(
                                              homeController
                                                  .filteredByCatPosts[index]
                                                  .title,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Positioned(
                                            top: 50,
                                            left: 10,
                                            child: Text(
                                              homeController
                                                  .filteredByCatPosts[index]
                                                  .title,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            )),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
