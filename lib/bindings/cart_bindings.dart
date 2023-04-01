import 'package:cart_app/data/cache/cart_cache_impl.dart';
import 'package:cart_app/data/remotes/network_impl.dart';
import 'package:cart_app/domain/interfaces/caches/cart_cache.dart';
import 'package:cart_app/domain/interfaces/remotes/network.dart';
import 'package:cart_app/presentation/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<INetwork>(() => NetworkImpl());
    Get.lazyPut<ICartCache>(() => CartCacheImpl());
    Get.lazyPut(() => CartController());
  }
}
