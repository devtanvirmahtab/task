import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/core/constants/app_constant.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/my_text_style.dart';
import '../../../core/widgets/app_button.dart';
import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text("Wallet"),
        actions: [
          // HomeBannerSlider(),
          Icon(Icons.person),
          gapW(20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
              child: Column(
                children: [
                  linChart(),
                  gapH(30),
                  breakDown(),
                  gapH(10),
                ],
              ),
            ),
            accountDetail(),
            gapH(100),
          ],
        ),
      ),
    );
  }

  Widget linChart() {
    return Obx(() {
      if (controller.walletData.value == null) {
        return Center(child: CircularProgressIndicator());
      }

      final walletData = controller.walletData.value!;
      final barData = walletData.spendSchedules;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "This month",
            style: text14Style(),
          ),
          Text(
            "Spend Chart",
            style: text18Style(),
          ),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),
                barGroups: barData.asMap().entries.map((entry) {
                  int index = entry.key;
                  double value = entry.value;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value,
                        color: AppColor.infoColor,
                        width: 45,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ],
                  );
                }).toList(),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        int index = value.toInt();
                        if (index >= 0 && index < barData.length) {
                          return Text('\$${barData[index].toStringAsFixed(0)}',
                              style: TextStyle(fontSize: 12));
                        } else {
                          return Text('');
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget breakDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BreakDown',
          style: text18Style(),
        ),
        gapH(10),
        Row(
          children: [
            breakDownItem(title: 'Food', value: '45'),
            gapW(10),
            breakDownItem(title: 'Food', value: '45'),
            gapW(10),
            breakDownItem(title: 'Food', value: '45'),
            gapW(10),
            breakDownItem(title: 'Food', value: '45'),
          ],
        )
      ],
    );
  }

  breakDownItem({required String title, required String value}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColor.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColor.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ]),
          child: Text(
            '$value%',
            style: text18Style(color: AppColor.redLight),
          ),
        ),
        gapH(8),
        Text(
          title,
          style: text14Style(),
        )
      ],
    );
  }

  Widget accountDetail() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(
          30,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurpleAccent.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 30,
            offset: Offset(-100, -10)
          )
        ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('account'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                  color: AppColor.black,
                )),
                child: Text('2555 4555 '),
              ),
            ],
          ),
          gapH(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('password'),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                  color: AppColor.black,
                )),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Text('*******'),
              ),
            ],
          ),
          gapH(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Exp date: 12/24'),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Colors.deepPurpleAccent,
                    ],
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 8),
                child: Text('Delete Card',style: text14Style(isWhiteColor: true),),
              ),
            ],
          ),
          gapH(20),
          AppButton(
            text: 'SKIP',
            backgroundColor: AppColor.infoColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
