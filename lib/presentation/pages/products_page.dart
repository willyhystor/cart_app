import 'package:cart_app/presentation/controllers/products_controller.dart';
import 'package:cart_app/presentation/widgets/filter_price_modal.dart';
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
              onTap: () {},
              child: const Icon(Icons.shopping_cart),
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
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product image
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Colors.grey.withOpacity(0.25),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    controller.filteredProducts[index].images.first,
                    // fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 20),

                // Product detail
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        '${controller.filteredProducts[index].brand} - ${controller.filteredProducts[index].title}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Description
                      Text(
                        controller.filteredProducts[index].description,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Description
                      Text(
                        '\$ ${usCurrency.format(controller.filteredProducts[index].price)}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue),
                          ),
                          onPressed: () {
                            controller.addProductToCart(
                                controller.filteredProducts[index]);
                          },
                          child: Text(
                            'cart_add'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
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
