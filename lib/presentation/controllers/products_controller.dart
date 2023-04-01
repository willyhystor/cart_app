import 'package:cart_app/domain/interfaces/product_remote.dart';
import 'package:cart_app/domain/models/product.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final _productRemote = Get.find<IProductRemote>();

  final _products = <Product>[];
  final filteredProducts = <Product>[].obs;

  @override
  void onInit() async {
    super.onInit();

    final products = await _productRemote.getProducts();
    _products.addAll(products);

    filteredProducts.addAll(_products);
  }
}
