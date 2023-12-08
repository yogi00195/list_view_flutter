import 'dart:convert';
class Mandi {
  final String state;
  final String district;
  final String market;
  final String commodity;
  final String variety;
  final String grade;
  final String arrivalDate;
  final double minPrice;
  final double maxPrice;
  final double modalPrice;

  Mandi({
    required this.state,
    required this.district,
    required this.market,
    required this.commodity,
    required this.variety,
    required this.grade,
    required this.arrivalDate,
    required this.minPrice,
    required this.maxPrice,
    required this.modalPrice,
  });
}


List<Mandi> parseMandi(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return List<Mandi>.from(parsed['records'].map((record) => Mandi(
    state: record['state'],
    district: record['district'],
    market: record['market'],
    commodity: record['commodity'],
    variety: record['variety'],
    grade: record['grade'],
    arrivalDate: record['arrival_date'],
    minPrice: double.parse(record['min_price']),
    maxPrice: double.parse(record['max_price']),
    modalPrice: double.parse(record['modal_price']),
  )));
}
