import 'package:cart_app/data/cache/cart_cache_impl.dart';
import 'package:cart_app/data/remotes/network_impl.dart';
import 'package:cart_app/data/remotes/product_remote_impl.dart';
import 'package:cart_app/domain/interfaces/caches/cart_cache.dart';
import 'package:cart_app/domain/interfaces/remotes/network.dart';
import 'package:cart_app/domain/interfaces/remotes/product_remote.dart';
import 'package:cart_app/presentation/controllers/products_controller.dart';
import 'package:get/get.dart';

// https://github.com/jonataslaw/getx/blob/master/example_nav2/lib/app/modules/dashboard/bindings/dashboard_binding.dart
// The sample used Binding, but in the package there is no binding 😅

class ProductsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<INetwork>(() => NetworkImpl());
    Get.lazyPut<IProductRemote>(() => ProductRemoteImpl());
    Get.lazyPut<ICartCache>(() => CartCacheImpl());
    Get.lazyPut(() => ProductsController());
  }
}
