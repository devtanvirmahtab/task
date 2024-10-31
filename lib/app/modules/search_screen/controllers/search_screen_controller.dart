import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/model/product_model.dart';
import '../../../data/model/search_data_model.dart';
import '../../../network/api_client.dart';
import '../../../network/api_endpoints.dart';

class SearchScreenController extends GetxController {
  final searchData = SearchData().obs;
  final productList = <Product>[].obs;
  final isLoading = false.obs;

  final selectedItem = ''.obs;

  @override
  void onInit() {
    loadData();
    fetchData();
    super.onInit();

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

  Future<void> fetchData() async {
    isLoading.value = true;
    var response = await ApiClient().getAPI(allFeedUrl, fetchData);
    isLoading.value = false;
    if(response != null){
      productList.value = parseProducts(response.data);
      print(productList.length);
    }
    print(response.toString());
  }

  @override
  void onClose() {
    super.onClose();
  }

}
