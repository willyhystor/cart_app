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
  RxInt minPrice = 0.obs;

  @override
  void onInit() async {
    super.onInit();

    await fetchProducts();
  }

  Future<void> fetchProducts() async {
    final products = await _productRemote.getProducts();
    _products.addAll(products);

    filterProducts();
  }

  void addProductToCart(Product product) async {
    await _cartCache.addItem(product);
  }

  void updateMinPrice(int value) {
    minPrice.value = value;

    filterProducts();
  }

  void filterProducts() async {
    viewStatus.value = ViewStatus.loading;

    // To simulate filter process
    await Future.delayed(const Duration(milliseconds: 250));

    final newProducts =
        _products.where((e) => e.price > minPrice.value).toList();
    filteredProducts.value = [...newProducts];

    viewStatus.value = ViewStatus.idle;
  }
}
