class SearchData {
  final Map<String, TimePeriodData>? data;
  final List<String>? timePeriods;
  final String? selectedTimePeriod;

  SearchData({
     this.data,
     this.timePeriods,
     this.selectedTimePeriod,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) {
    var dataMap = (json['data'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, TimePeriodData.fromJson(value)),
    );

    return SearchData(
      data: dataMap,
      timePeriods: List<String>.from(json['timePeriods']),
      selectedTimePeriod: json['selectedTimePeriod'],
    );
  }
}

class TimePeriodData {
  final List<String> xAxisData;
  final List<int> yAxisData;

  TimePeriodData({
    required this.xAxisData,
    required this.yAxisData,
  });

  factory TimePeriodData.fromJson(Map<String, dynamic> json) {
    return TimePeriodData(
      xAxisData: List<String>.from(json['xAxisData']),
      yAxisData: List<int>.from(json['yAxisData']),
    );
  }
}
