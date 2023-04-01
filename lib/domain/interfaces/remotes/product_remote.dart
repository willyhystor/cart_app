import 'package:cart_app/domain/models/product.dart';

abstract class IProductRemote {
  Future<List<Product>> getProducts();
}
