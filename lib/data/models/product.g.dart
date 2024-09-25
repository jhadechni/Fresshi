// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      originalPrice: (json['originalPrice'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num).toDouble(),
      image: json['image'] as String,
      stockQuantity: (json['stockQuantity'] as num).toInt(),
      unitOfMeasurement: json['unitOfMeasurement'] as String,
      description: json['description'] as String,
      quantityPerSale: (json['quantityPerSale'] as num).toInt(),
      category: json['category'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      ratings: (json['ratings'] as num).toDouble(),
      cultivationRegion: json['cultivationRegion'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'originalPrice': instance.originalPrice,
      'discountPrice': instance.discountPrice,
      'image': instance.image,
      'stockQuantity': instance.stockQuantity,
      'unitOfMeasurement': instance.unitOfMeasurement,
      'description': instance.description,
      'quantityPerSale': instance.quantityPerSale,
      'category': instance.category,
      'tags': instance.tags,
      'ratings': instance.ratings,
      'cultivationRegion': instance.cultivationRegion,
    };
