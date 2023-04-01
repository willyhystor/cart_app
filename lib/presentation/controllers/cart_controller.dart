import 'package:cart_app/domain/interfaces/caches/cart_cache.dart';
import 'package:cart_app/domain/models/cart_item.dart';
import 'package:cart_app/shared/global_variables.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // Dependencies
  final _cartCache = Get.find<ICartCache>();

  // States
  final cartItems = <CartItem>[].obs;
  Rx<ViewStatus> viewStatus = ViewStatus.loading.obs;

  @override
  void onInit() {
    super.onInit();

    getCartItems();
  }

  void getCartItems() async {
    final cartItemsFromCache = await _cartCache.getItems();
    cartItems.value = [...cartItemsFromCache];

    viewStatus.value = ViewStatus.idle;
  }

  void addQuantity(int index) async {
    cartItems[index].quantity++;

    await _cartCache.updateItem(index, cartItems[index]);

    cartItems.value = [...cartItems];
  }

  void subsQuantity(int index) async {
    if (cartItems[index].quantity > 0) {
      cartItems[index].quantity--;

      await _cartCache.updateItem(index, cartItems[index]);

      cartItems.value = [...cartItems];
    }
  }

  void deleteCartItem(int index) async {
    await _cartCache.deleteItem(index);

    getCartItems();
  }
}
