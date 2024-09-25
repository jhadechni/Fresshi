import 'package:fresshi/data/models/product.dart';
import 'package:fresshi/domain/repositories/product_repository.dart';

class ProductRepositoryIml extends ProductRepository{
  @override
  Future<Product?> getProductById(String productId) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

}