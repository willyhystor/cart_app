import 'package:cart_app/bindings/products_bindings.dart';
import 'package:cart_app/presentation/pages/products_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.products;

  static final routes = [
    GetPage(
      name: Routes.products,
      binding: ProductsBindings(),
      page: () => ProductsPage(),
    ),
  ];
}
