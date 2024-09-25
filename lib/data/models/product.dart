import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  final String name;
  final double originalPrice;
  final double discountPrice;
  final String image;
  final int stockQuantity;
  final String unitOfMeasurement;
  final String description;
  final int quantityPerSale;
  final String category;
  final List<String> tags;
  final double ratings;
  final String cultivationRegion;

  Product({
    required this.id,
    required this.name,
    required this.originalPrice,
    required this.discountPrice,
    required this.image,
    required this.stockQuantity,
    required this.unitOfMeasurement,
    required this.description,
    required this.quantityPerSale,
    required this.category,
    required this.tags,
    required this.ratings,
    required this.cultivationRegion,
  });

  int get availableUnits => stockQuantity ~/ quantityPerSale;

  double get discountPercentage {
    if (originalPrice == 0) return 0;
    return ((originalPrice - discountPrice) / originalPrice) * 100;
  }

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

