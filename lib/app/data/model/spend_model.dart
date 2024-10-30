class WalletData {
  final String period;
  final String currency;
  final List<double> spendSchedules;

  WalletData({
    required this.period,
    required this.currency,
    required this.spendSchedules,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) {
    var data = json['spend']['data'][0];
    return WalletData(
      period: json['period'],
      currency: json['currency'],
      spendSchedules: [
        data['1st_schedule'] ?? 0,
        data['2nd_schedule'] ?? 0,
        data['3rd_schedule'] ?? 0,
        data['4th_schedule'] ?? 0,
        data['5th_schedule'] ?? 0,
      ],
    );
  }
}
