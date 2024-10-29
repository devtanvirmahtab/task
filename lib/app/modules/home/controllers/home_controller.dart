import 'package:get/get.dart';

class HomeController extends GetxController {
  final jsonData = {
    "data": {
      "1W": {
        "xAxisData": ["MON", "TUE", "WED", "THU", "FRI", "SAT"],
        "yAxisData": [1000, 1200, 1500, 2200, 3500, 5000]
      },
      "1M": {
        "xAxisData": ["Week 1", "Week 2", "Week 3", "Week 4"],
        "yAxisData": [15000, 20000, 25000, 30000]
      },
      "3M": {
        "xAxisData": ["Jan", "Feb", "Mar"],
        "yAxisData": [45000, 50000, 60000]
      },
      "6M": {
        "xAxisData": ["Oct", "Nov", "Dec", "Jan", "Feb", "Mar"],
        "yAxisData": [70000, 75000, 80000, 85000, 90000, 95000]
      },
      "1Y": {
        "xAxisData": ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar"],
        "yAxisData": [100000, 105000, 110000, 120000, 130000, 140000, 150000, 155000, 160000, 165000, 170000, 175000]
      },
      "ALL": {
        "xAxisData": ["2020", "2021", "2022", "2023"],
        "yAxisData": [300000, 350000, 400000, 450000]
      }
    },
    "timePeriods": ["1W", "1M", "3M", "6M", "1Y", "ALL"],
    "selectedTimePeriod": "1W"
  };

  var selectedTimePeriod = '1W'.obs;
  RxList<double> yAxisData = <double>[].obs;
  RxList<String> xAxisData = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    updateChartData();
  }


  void updateChartData() {
    final dataMap = jsonData['data'] as Map<String, dynamic>?;

    if (dataMap != null && dataMap.containsKey(selectedTimePeriod.value)) {
      final periodData = dataMap[selectedTimePeriod.value] as Map<String, dynamic>;

      // Casting yAxisData and xAxisData
      yAxisData.value = List<double>.from((periodData['yAxisData'] as List).map((e) => e.toDouble()));
      xAxisData.value = List<String>.from(periodData['xAxisData']);
    } else {
      yAxisData.clear();
      xAxisData.clear();
    }
  }

  void changeTimePeriod(String period) {
    selectedTimePeriod.value = period;
    updateChartData();
  }

  @override
  void onClose() {
    super.onClose();
  }

}