import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/consts/image_constants.dart';
import 'package:jewellery/consts/route_const.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }
  Future<void> navigateToNextScreen() async {
    Timer(const Duration(seconds: 2), () {
      Get.offAndToNamed(RouteConst.taskListScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstant.splash), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
