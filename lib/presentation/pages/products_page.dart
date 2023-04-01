import 'package:cart_app/domain/models/product.dart';
import 'package:cart_app/presentation/controllers/products_controller.dart';
import 'package:cart_app/presentation/widgets/filter_price_modal.dart';
import 'package:cart_app/presentation/widgets/product_card.dart';
import 'package:cart_app/routes/app_pages.dart';
import 'package:cart_app/shared/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends GetView<ProductsController> {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text('products'.tr),
          actions: [
            GestureDetector(
              onTap: () => _showFilterPriceModal(context, controller),
              child: const Icon(Icons.filter_alt),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.cart),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.shopping_cart),
                  if (controller.cartItems.isNotEmpty)
                    Positioned(
                      left: 8,
                      top: 8,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        child: Text(
                          controller.cartItems.length.toString(),
                          style: const TextStyle(fontSize: 8),
                        ),
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: _bodyBuilder(controller),
      );
    });
  }

  Widget _bodyBuilder(ProductsController controller) {
    if (controller.viewStatus.value == ViewStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: controller.filteredProducts.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: controller.filteredProducts[index],
          addToCart: (Product product) => controller.addProductToCart(product),
        );
      },
    );
  }

  void _showFilterPriceModal(
      BuildContext context, ProductsController controller) async {
    final result = await showModalBottomSheet<int>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: FilterPriceModal(
            minPrice: controller.minPrice.value,
          ),
        );
      },
    );

    if (result != null) {
      controller.updateMinPrice(result);
    }
  }
}
