import 'package:get/get.dart';
import 'package:task/app/modules/home/views/home_view.dart';
import 'package:task/app/modules/search_screen/views/search_screen_view.dart';
import 'package:task/app/modules/wallet/views/wallet_view.dart';

class MainNavController extends GetxController {
  final selectedPage = 0.obs;
 final pageList = [
   HomeView(),
   SearchScreenView(),
   WalletView()
 ];


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
