import 'dart:convert';

import 'package:cart_app/domain/interfaces/caches/cart_cache.dart';
import 'package:cart_app/domain/models/cart_item.dart';
import 'package:cart_app/domain/models/product.dart';
import 'package:get_storage/get_storage.dart';

class CartCacheImpl implements ICartCache {
  final box = GetStorage();

  @override
  Future<void> addItem(Product product) async {
    final productIdsEncoded = box.read(Product.key);

    List<int> productIds = [];
    if (productIdsEncoded != null) {
      productIds = List<int>.from(jsonDecode(productIdsEncoded));
    }

    // If ids empty or
    // ids does not contain product id
    if (!productIds.contains(product.id)) {
      // get current items
      final cartItems = await getItems();

      // add new product as item
      cartItems.add(CartItem(
        product: product,
        quantity: 1,
      ));

      // encode it back
      final cartItemMaps = cartItems.map((e) => e.toMap()).toList();
      box.write(CartItem.keyList, jsonEncode(cartItemMaps));

      // add new product id to ids
      productIds.add(product.id);
      box.write(Product.key, jsonEncode(productIds));
    }
  }

  @override
  Future<void> deleteItem(int index) async {
    final cartItems = await getItems();

    cartItems.removeAt(index);

    // encode it back
    final cartItemMaps = cartItems.map((e) => e.toMap()).toList();
    box.write(CartItem.keyList, jsonEncode(cartItemMaps));

    // remove product id
    final productIdsEncoded = box.read(Product.key);
    final productIds = jsonDecode(productIdsEncoded) as List<int>;
    productIds.removeAt(index);
    box.write(Product.key, jsonEncode(productIds));
  }

  @override
  Future<List<CartItem>> getItems() async {
    final cartItemsEncoded = box.read(CartItem.keyList);

    if (cartItemsEncoded != null) {
      final cartItemMaps = jsonDecode(cartItemsEncoded);
      final cartItems = <CartItem>[];

      // reconstruct map to list of object
      for (final map in cartItemMaps) {
        cartItems.add(CartItem(
          product: Product.fromMap(map[Product.key]),
          quantity: map[CartItem.keyQuantity],
        ));
      }

      return cartItems;
    }

    return [];
  }
}
