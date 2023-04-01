import 'package:cart_app/domain/models/cart_item.dart';
import 'package:cart_app/domain/models/product.dart';

abstract class ICartCache {
  Future<void> addItem(Product product);
  Future<void> updateItem(int index, CartItem cartItem);
  Future<void> deleteItem(int index);
  Future<List<CartItem>> getItems();
}
