import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../controllers/main_nav_controller.dart';

class MainNavView extends GetView<MainNavController> {
  const MainNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            return controller.pageList[controller.selectedPage.value];
          }),
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  24),
              child: Container(
                color: Colors.white.withOpacity(0.2),
                height: 82,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: AppColor.black.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        bottomTabItem(
                          icon: Icons.home_rounded,
                          text: 'Home',
                          onTap: () {
                            controller.selectedPage.value = 0;
                          }, isSelected: controller.selectedPage.value == 0,
                        ),
                        bottomTabItem(
                          icon: Icons.search_rounded,
                          text: 'Search',
                          onTap: () {
                            controller.selectedPage.value = 1;
                          }, isSelected: controller.selectedPage.value == 1,
                        ),
                        bottomTabItem(
                          icon: Icons.account_balance_wallet_outlined,
                          text: 'Wallet',
                          onTap: () {
                            controller.selectedPage.value = 2;
                          }, isSelected: controller.selectedPage.value == 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: Obx(() {
      //   return BottomNavigationBar(
      //     currentIndex: controller.selectedPage.value,
      //     selectedItemColor: AppColor.infoColor,
      //     onTap: (value) {
      //       controller.selectedPage.value = value;
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home_rounded,), label: 'Home'),
      //       BottomNavigationBarItem(icon: Icon(Icons.search,), label: 'Search'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.account_balance_wallet_outlined,),
      //           label: 'Wallet'),
      //     ],
      //   );
      // }),
    );
  }

  Widget bottomTabItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color:isSelected? AppColor.infoColor : AppColor.black,),
          Text(text),
        ],
      ),
    );
  }
}
