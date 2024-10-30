import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/model/spend_model.dart';

class WalletController extends GetxController {
  Rx<WalletData?> walletData = Rx<WalletData?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchWalletData();
  }

  Future<void> fetchWalletData() async {
    String response = await rootBundle.loadString('assets/data/Wallet_Chart.json');
    walletData.value = WalletData.fromJson(jsonDecode(response));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
