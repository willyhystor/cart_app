import 'package:cart_app/presentation/controllers/products_controller.dart';
import 'package:cart_app/shared/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends GetView<ProductsController> {
  const ProductsPage({super.key});

  // final _productsController = Get.find<ProductsController>();

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
      body: Obx(() {
        if (controller.viewStatus.value == ViewStatus.loading) {
          return const CircularProgressIndicator();
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
                            width: 4, color: Colors.grey.withOpacity(0.25)),
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
                              onPressed: () {},
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
      }),
    );
  }
}
