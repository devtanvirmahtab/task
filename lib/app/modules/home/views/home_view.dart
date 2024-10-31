import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/core/constants/app_constant.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/my_text_style.dart';
import '../../../core/widgets/home_banner_slider.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            SizedBox(
              width: Get.width,
              height: 190,
              child: HomeBannerSlider(),
            ),
            billPayment(),
            activeLoans(),
          ],
        ),
      ),
    );
  }

  Widget header(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/victory.png',
                width: 25,
                height: 25,
              ),
              gapW(10),
              Text("Hey George!",style: text18Style(),),
            ],
          ),
          Row(
            children: [
              Icon(Icons.search),
              gapW(20),
              Icon(Icons.notifications_rounded),
            ],
          )
        ],
      ),
    );
  }

  Widget billPayment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Recent Product',
            style: text18Style(),
          ),
        ),
        gapH(10),
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColor.likeGrey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.light_mode_sharp,
                        size: 30,
                      ),
                    ),
                    gapH(8),
                    Text(
                      'data',
                      style: text14Style(),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return gapW(20);
            },
          ),
        )
      ],
    );
  }

  Widget activeLoans() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Active Loans',
                style: text18Style(),
              ),
              Text(
                'See All',
                style: text14Style(),
              ),
            ],
          ),
        ),
        gapH(10),
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColor.likeGrey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.home,
                        size: 30,
                      ),
                    ),
                    gapH(8),
                    Text(
                      'data',
                      style: text14Style(),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return gapW(20);
            },
          ),
        )
      ],
    );
  }
}
