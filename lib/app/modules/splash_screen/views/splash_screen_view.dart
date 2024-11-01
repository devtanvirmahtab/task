import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/my_text_style.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          controller.title,
          style: text20Style(
            isPrimaryColor: true,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
