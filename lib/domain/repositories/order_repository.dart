import 'package:fresshi/data/models/order.dart';

abstract class OrderRepository {
  Future<void> createOrder(Order order);
  Future<void> updateOrder(Order order);
  Future<void> deleteOrder(Order order);
  Future<Order?> getOrderById(String orderId);
  Future<List<Order>> getOrdersByUserId(String userId);
}