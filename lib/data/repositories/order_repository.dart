import 'package:fresshi/data/models/order.dart';

import '../../domain/repositories/order_repository.dart';

class OrderRepositoryIml extends OrderRepository {
  @override
  Future<void> createOrder(Order order) {
    // TODO: implement createOrder
    throw UnimplementedError();
  }

  @override
  Future<void> deleteOrder(Order order) {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future<Order?> getOrderById(String orderId) {
    // TODO: implement getOrderById
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getOrdersByUserId(String userId) {
    // TODO: implement getOrdersByUserId
    throw UnimplementedError();
  }

  @override
  Future<void> updateOrder(Order order) {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }

  
}
