import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WalletView'),
        centerTitle: true,
      ),
      body:Column(
        children: [
          barChatDatad(),
        ],
      ),
    );
  }

  barChatDatad(){
    return SizedBox(
      height: 500,
      child: BarChart(
          BarChartData(
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: getTitles,
                  reservedSize: 38,
                ),
              ),
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: showingGroups(),
            gridData: const FlGridData(show: false),
          )
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.greenAccent,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('M', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == controller.touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == controller.touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == controller.touchedIndex);
      case 3:
        return makeGroupData(3, 7.5, isTouched: i == controller.touchedIndex);
      case 4:
        return makeGroupData(4, 9, isTouched: i == controller.touchedIndex);
      case 5:
        return makeGroupData(5, 11.5, isTouched: i == controller.touchedIndex);
      case 6:
        return makeGroupData(6, 6.5, isTouched: i == controller.touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 30,
        List<int> showTooltips = const [],
      }) {
    barColor ??= barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
            toY: isTouched ? y + 1 : y,
            color: isTouched ? Colors.green : barColor,
            width: width,
            borderSide: isTouched
                ? BorderSide(color: Colors.green)
                : const BorderSide(color: Colors.white, width: 0),
            backDrawRodData: BackgroundBarChartRodData(
              show: false,
              toY: 20,
              color: Colors.green ,
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
