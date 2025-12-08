import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nahar/View/Screen/SplashScreen/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final controller = Get.put(SplashScreenController());
    controller.navigate();
  }

  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.green,
          body:Center(
            child:Container(
              height:192.h,
              width:192.w,
              decoration:BoxDecoration(
                color:Colors.white,
                borderRadius:BorderRadius.only(
                  //bottomLeft:Radius.circular(50),
                  bottomRight: Radius.circular(50.r),
                  topLeft: Radius.circular(50.r),
                ),
                image:DecorationImage(image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdN5KBQhbX4KGZ4Pfl17uAmVX3251BNmRhvA&s"),fit:BoxFit.fill)
              ),
            ),
          ),
        );
      },
    );
  }
}
