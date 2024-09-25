import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

enum OrderStatus {
  pending,    // Pendiente
  shipped,    // Enviado
  delivered,  // Entregado
  cancelled,  // Cancelado
}

@JsonSerializable()
class Order {
  final String orderId;
  final DateTime orderDate;
  final String userId; // ID del usuario que realizó el pedido (C.C)
  final List<String> productIds; // IDs de los productos en el pedido
  final double totalAmount;
  final String paymentMethod; // Método de pago utilizado
  final String shippingAddress;
  final OrderStatus orderStatus; // Estado del pedido como enum
  final String? trackingNumber; // Número de seguimiento (opcional)
  final DateTime? deliveryDate; // Fecha estimada de entrega (opcional)

  Order({
    required this.orderId,
    required this.orderDate,
    required this.userId,
    required this.productIds,
    required this.totalAmount,
    required this.paymentMethod,
    required this.shippingAddress,
    required this.orderStatus,
    this.trackingNumber,
    this.deliveryDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
