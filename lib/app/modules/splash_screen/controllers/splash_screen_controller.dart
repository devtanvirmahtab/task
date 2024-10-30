import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final title = 'Wallet';

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {

      Future.delayed(const Duration(seconds: 1),() {
        Get.toNamed(Routes.MAIN_NAV);
      },);
    });

    super.onInit();
  }


  @override
  void onClose() {
    super.onClose();
  }

}
