import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_nav_controller.dart';

class MainNavView extends GetView<MainNavController> {
  const MainNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.pageList[controller.selectedPage.value];
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedPage.value,
        onTap: (value){
          controller.selectedPage.value = value;
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search,),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined,),label: 'Wallet'),
        ],
      ),
    );
  }
}
