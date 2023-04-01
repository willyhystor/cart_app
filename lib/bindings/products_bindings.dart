import 'package:cart_app/data/network_impl.dart';
import 'package:cart_app/data/product_remote_impl.dart';
import 'package:cart_app/domain/interfaces/network.dart';
import 'package:cart_app/domain/interfaces/product_remote.dart';
import 'package:cart_app/presentation/controllers/products_controller.dart';
import 'package:get/get.dart';

// https://github.com/jonataslaw/getx/blob/master/example_nav2/lib/app/modules/dashboard/bindings/dashboard_binding.dart
// The sample used Binding, but in the package there is no binding 😅

class ProductsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<INetwork>(() => NetworkImpl());
    Get.lazyPut<IProductRemote>(() => ProductRemoteImpl());
    Get.lazyPut(() => ProductsController());
  }
}
