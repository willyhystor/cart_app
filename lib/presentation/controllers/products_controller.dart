import 'package:cart_app/domain/interfaces/caches/cart_cache.dart';
import 'package:cart_app/domain/interfaces/remotes/product_remote.dart';
import 'package:cart_app/domain/models/product.dart';
import 'package:cart_app/shared/global_variables.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  // Dependencies
  final _productRemote = Get.find<IProductRemote>();
  final _cartCache = Get.find<ICartCache>();

  // States
  final _products = <Product>[];
  final filteredProducts = <Product>[].obs;
  Rx<ViewStatus> viewStatus = ViewStatus.loading.obs;

  @override
  void onInit() async {
    super.onInit();

    final products = await _productRemote.getProducts();
    _products.addAll(products);

    filteredProducts.addAll(_products);

    viewStatus.value = ViewStatus.idle;
  }

  void addProductToCart(Product product) async {
    await _cartCache.addItem(product);
  }
}
