import 'package:cart_app/presentation/controllers/cart_controller.dart';
import 'package:cart_app/presentation/widgets/cart_item_card.dart';
import 'package:cart_app/shared/global_variables.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text('your_cart'.tr),
        ),
        body: _bodyBuilder(controller),
      );
    });
  }

  Widget _bodyBuilder(CartController controller) {
    if (controller.viewStatus.value == ViewStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (controller.cartItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('cart_empty'.tr),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: Get.back,
              child: Text('browse_more'.tr),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: controller.cartItems.length,
            itemBuilder: (context, index) {
              return CartItemCard(
                cartItem: controller.cartItems[index],
                addQuantity: () => controller.addQuantity(index),
                subsQuantity: () => controller.subsQuantity(index),
                deleteCartItem: () => controller.deleteCartItem(index),
              );
            },
          ),
        ),
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '${'total'.tr}: \$ ${usCurrency.format(controller.totalPrice.value)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                  ),
                  child: Text(
                    'checkout'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
