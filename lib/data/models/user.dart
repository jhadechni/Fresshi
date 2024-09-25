import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String firstName;
  final String lastName;
  final String id; // colombian id
  final DateTime dateOfBirth;
  final String email;
  final String phoneNumber;
  final List<String> orders; // Array de IDs de las órdenes
  final List<String> likedProducts; // Array de IDs de los productos que le gustan
  final String? preferences; //TODO: Se puede agregar en el futuro, ahora no se utiliza (MVP)
  final List<String> paymentMethods;
  final String address;

  User({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.dateOfBirth,
    required this.email,
    required this.phoneNumber,
    required this.orders,
    required this.likedProducts,
    this.preferences,
    required this.paymentMethods,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
