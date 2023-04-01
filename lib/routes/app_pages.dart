import 'package:cart_app/bindings/cart_bindings.dart';
import 'package:cart_app/bindings/products_bindings.dart';
import 'package:cart_app/presentation/pages/cart_page.dart';
import 'package:cart_app/presentation/pages/products_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.products;

  static final routes = [
    GetPage(
      name: AppRoutes.products,
      binding: ProductsBindings(),
      page: () => const ProductsPage(),
    ),
    GetPage(
      name: AppRoutes.cart,
      binding: CartBindings(),
      page: () => const CartPage(),
    ),
  ];
}
