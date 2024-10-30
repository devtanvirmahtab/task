import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/widgets/line_chart_sample1.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart Example"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Get.to(LineChartSample1());
          }, child: Text("Nest")),
          Obx(() => DropdownButton<String>(
            value: controller.selectedTimePeriod.value,
            items: (controller.jsonData['timePeriods'] as List?)
                ?.map<DropdownMenuItem<String>>((period) => DropdownMenuItem(
              value: period,
              child: Text(period),
            ))
                .toList() ?? [], // Return an empty list if 'timePeriods' is null
            onChanged: (value) {
              if (value != null) controller.changeTimePeriod(value);
            },
          )),
          Expanded(
            child: Obx(() => LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        return Text(controller.xAxisData[value.toInt()]);
                      },
                    ),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(controller.yAxisData.length, (index) {
                      return FlSpot(index.toDouble(), controller.yAxisData[index]);
                    }),
                    isCurved: true,
                    barWidth: 3,
                    color: Colors.blue,
                    belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
