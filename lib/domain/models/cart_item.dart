import 'package:cart_app/domain/models/product.dart';

class CartItem {
  static const String key = 'cart_item';
  static const String keyList = 'cart_items';
  static const String keyQuantity = 'quantity';

  Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  static CartItem fromMap(Map<String, dynamic> map) {
    return CartItem(
      product: Product.fromMap(map[Product.key]),
      quantity: map[keyQuantity],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      Product.key: product.toMap(),
      keyQuantity: quantity,
    };
  }
}
