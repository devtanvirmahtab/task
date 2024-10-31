import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class HomeBannerSlider extends StatelessWidget {
  HomeBannerSlider({
    super.key,
  });

  CarouselSliderController carouselController = CarouselSliderController();
  final ValueNotifier<int> _currentSelectedIndex = ValueNotifier(0);

  final list = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        carousel.CarouselSlider(
          carouselController: carouselController,
          options: carousel.CarouselOptions(
            height: 150.0,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, _) {
              _currentSelectedIndex.value = index;
            },
          ),
          items: list.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                      // image: DecorationImage(
                      //     image: NetworkImage(slider.image?? '')
                      // )
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'text ',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        ValueListenableBuilder(
            valueListenable: _currentSelectedIndex,
            builder: (context, updatedValue, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < (list.length ?? 0); i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      margin: const EdgeInsets.all(3),
                      height: 10,
                      width: i == _currentSelectedIndex.value ? 30 : 10,
                      decoration: BoxDecoration(
                        color: i == _currentSelectedIndex.value
                            ? AppColor.primaryColor
                            : null,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: i == _currentSelectedIndex.value
                                ? AppColor.primaryColor
                                : Colors.black26),
                      ),
                    )
                ],
              );
            }),
      ],
    );
  }
}