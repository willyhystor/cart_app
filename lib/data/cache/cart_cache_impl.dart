import 'dart:convert';

import 'package:cart_app/domain/interfaces/caches/cart_cache.dart';
import 'package:cart_app/domain/models/cart_item.dart';
import 'package:cart_app/domain/models/product.dart';
import 'package:get_storage/get_storage.dart';

class CartCacheImpl implements ICartCache {
  final box = GetStorage();

  @override
  Future<void> addItem(Product product) async {
    final cartItems = await getItems();

    // add new product
    cartItems.add(CartItem(product: product, quantity: 1));

    // encode it back
    final cartItemMaps = cartItems.map((e) => e.toMap()).toList();
    box.write(CartItem.keyList, jsonEncode(cartItemMaps));
  }

  @override
  Future<void> deleteItem(int index) async {
    final cartItems = await getItems();

    cartItems.removeAt(index);

    // encode it back
    final cartItemMaps = cartItems.map((e) => e.toMap()).toList();
    box.write(CartItem.keyList, jsonEncode(cartItemMaps));
  }

  @override
  Future<List<CartItem>> getItems() async {
    final cartItemsEncoded = box.read(CartItem.keyList);
    final cartItemMaps = jsonDecode(cartItemsEncoded);
    final cartItems = <CartItem>[];

    // reconstruct map to list of object
    for (final map in cartItemMaps) {
      cartItems.add(CartItem(
          product: map[Product.key], quantity: map[CartItem.keyQuantity]));
    }

    return cartItems;
  }
}
