import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/core/constants/app_constant.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/my_text_style.dart';
import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wallet")),
      body: Column(
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
          Expanded(child: accountDetail()),
        ],
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
        children: [
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Spending for ${walletData.period} in ${walletData.currency}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
            color: AppColor.likeGrey,
            shape: BoxShape.circle,
          ),
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
        color: AppColor.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [Text('data')],
          )
        ],
      ),
    );
  }
}
