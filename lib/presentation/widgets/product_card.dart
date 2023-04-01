import 'package:cart_app/domain/models/product.dart';
import 'package:cart_app/shared/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function(Product product) addToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
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
                product.images.first,
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
                    '${product.brand} - ${product.title}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Description
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Description
                  Text(
                    '\$ ${usCurrency.format(product.price)}',
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
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () => addToCart(product),
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
  }
}
