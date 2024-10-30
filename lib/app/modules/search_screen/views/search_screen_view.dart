import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/core/constants/my_text_style.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constant.dart';
import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  const SearchScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              chartTapMenu(),
              gapH(20),
              chart(),
              gapH(25),
              spendingCard(),
              gapH(30),
              Text(
                'Recent Product',
                style: text18Style(),
              ),
              gapH(20),
              recentProduct(),
            ],
          ),
        ),
      ),
    );
  }

  Widget recentProduct() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.likeGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'jdjaf',
                    style: text14Style(),
                  ),
                  gapW(10),
                  Text(
                    'jdjaf',
                    style: text14Style(),
                  ),
                  gapW(10),
                  Text(
                    'jdjaf',
                    style: text14Style(),
                  ),
                ],
              ),
            );
        },
        separatorBuilder: (context, index) {
          return gapW(10);
        },
      ),
    );
  }

  Widget spendingCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Spending',
                style: text14Style(isWhiteColor: true),
              ),
              Text(
                'Total Spending',
                style: text14Style(isWhiteColor: true),
              ),
            ],
          ),
          gapH(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$5001.86',
                style: text20Style(isWhiteColor: true),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColor.infoColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'PAY EARLY',
                  style: text14Style(isWhiteColor: true),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget chartTapMenu() {
    return Obx(() {
      return Container(
        height: 50,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.likeGrey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.searchData.value.timePeriods?.length ?? 0,
            itemBuilder: (context, index) {
              final data =
                  controller.searchData.value.timePeriods?[index] ?? '';
              return Obx(() {
                return InkWell(
                  onTap: () {
                    controller.selectedItem.value = data;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: controller.selectedItem.value == data
                          ? AppColor.black
                          : AppColor.likeGrey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      data,
                      style: text14Style(
                          isWhiteColor: controller.selectedItem.value == data),
                    ),
                  ),
                );
              });
            },
            separatorBuilder: (context, index) {
              return gapW(10);
            },
          ),
        ),
      );
    });
  }

  Widget chart() {
    return Obx(() {
      final periodData =
          controller.searchData.value.data?[controller.selectedItem.value];
      if (periodData != null) {
        return SizedBox(
          height: 200,
          child: LineChartWidget(
            xAxisData: periodData.xAxisData,
            yAxisData: periodData.yAxisData,
          ),
        );
      } else {
        return Text("No data available");
      }
    });
  }
}

class LineChartWidget extends StatelessWidget {
  final List<String> xAxisData;
  final List<int> yAxisData;

  const LineChartWidget(
      {super.key, required this.xAxisData, required this.yAxisData});

  @override
  Widget build(BuildContext context) {
    double yAxisInterval = calculateYAxisInterval(yAxisData);
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
            border: Border.all(
          color: Colors.grey.shade300,
        )),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          drawHorizontalLine: true,
          verticalInterval: 1,
          // Ensures only one vertical grid line per x-axis label
          horizontalInterval: yAxisInterval,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.grey[300],
            strokeWidth: 1,
            dashArray: null, // Ensures horizontal lines are solid
          ),
          getDrawingVerticalLine: (value) => FlLine(
            color: Colors.grey[300],
            strokeWidth: 1,
            dashArray: null, // Ensures vertical lines are solid
          ),
        ),
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
          )),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                int index = value.toInt();

                // Ensure index is within bounds to avoid double or empty titles
                if (index >= 0 && index < xAxisData.length) {
                  return Text(
                    xAxisData[index],
                    style: const TextStyle(fontSize: 10),
                  );
                }
                return const Text('');
              },
              interval:
                  1, // Ensures labels appear at each index position without overlapping
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              interval: 1,
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: yAxisData
                .asMap()
                .entries
                .map((entry) =>
                    FlSpot(entry.key.toDouble(), entry.value.toDouble()))
                .toList(),
            isCurved: true,
            barWidth: 5,
            color: Colors.blue,
            isStepLineChart: false,
            dotData: FlDotData(show: false),
            isStrokeCapRound: true,
          ),
        ],
      ),
    );
  }
}

double calculateYAxisInterval(List<int> yAxisData) {
  // Set interval based on the max y-value; e.g., 20% of the max value
  int maxValue = yAxisData.reduce((a, b) => a > b ? a : b);
  return (maxValue / 5).roundToDouble(); // Adjust division as needed
}
