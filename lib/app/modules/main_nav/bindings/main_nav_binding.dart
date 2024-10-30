import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../search_screen/controllers/search_screen_controller.dart';
import '../../wallet/controllers/wallet_controller.dart';
import '../controllers/main_nav_controller.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavController>(
      () => MainNavController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<SearchScreenController>(
          () => SearchScreenController(),
    );
    Get.lazyPut<WalletController>(
          () => WalletController(),
    );
  }
}
