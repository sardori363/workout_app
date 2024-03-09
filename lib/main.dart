import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/details/detail_binding.dart';
import 'package:workout_app/details/detail_page.dart';
import 'package:workout_app/home/home_binding.dart';
import 'package:workout_app/home/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),

        GetPage(
          name: "/details",
          page: () => const DetailPage(),
          transition: Transition.cupertino,
          transitionDuration: const Duration(seconds: 1),
          binding: DetailBinding(),
        ),
      ],
    );
  }
}
