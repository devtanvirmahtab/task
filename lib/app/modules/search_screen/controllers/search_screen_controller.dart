import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/model/search_data_model.dart';

class SearchScreenController extends GetxController {
  final searchData = SearchData().obs;

  final selectedItem = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    String response =
        await rootBundle.loadString('assets/data/Search_Chart.json');

    searchData.value = SearchData.fromJson(json.decode(response));
    selectedItem.value = searchData.value.selectedTimePeriod ?? '';
  }

  void updateSelectedPeriod(String period) {
    // searchData.value. = period;
    searchData.update((data) {
      // if (data != null) data.selectedTimePeriod = period;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

}
