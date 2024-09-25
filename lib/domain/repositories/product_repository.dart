import 'package:fresshi/data/models/product.dart';

abstract class ProductRepository {
  Future<Product?> getProductById(String productId);
  Future<List<Product>> getProducts();
}