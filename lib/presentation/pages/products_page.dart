import 'package:cart_app/presentation/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final _productsController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('products'.tr),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.filter_alt),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.shopping_cart),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Center(
        child: Text('Hola amigo'),
      ),
    );
  }
}
