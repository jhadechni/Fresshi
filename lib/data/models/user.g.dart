// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      id: json['id'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      orders:
          (json['orders'] as List<dynamic>).map((e) => e as String).toList(),
      likedProducts: (json['likedProducts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      preferences: json['preferences'] as String?,
      paymentMethods: (json['paymentMethods'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'id': instance.id,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'orders': instance.orders,
      'likedProducts': instance.likedProducts,
      'preferences': instance.preferences,
      'paymentMethods': instance.paymentMethods,
      'address': instance.address,
    };
