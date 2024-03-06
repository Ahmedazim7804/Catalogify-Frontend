import 'package:inno_hack/core/constants.dart';

class Catalog {
  Catalog({
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.brand,
    required this.warranty,
    required this.returnPeriod,
    required this.state,
  });

  final String title;
  final int price;
  final Categories category;
  final String description;
  final String brand;
  final int warranty;
  final int returnPeriod;
  final String state;
}
