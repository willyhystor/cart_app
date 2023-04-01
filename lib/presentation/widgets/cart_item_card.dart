import 'package:cart_app/domain/models/cart_item.dart';
import 'package:cart_app/shared/global_variables.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final Function addQuantity;
  final Function subsQuantity;
  final Function deleteCartItem;

  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.addQuantity,
    required this.subsQuantity,
    required this.deleteCartItem,
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
                cartItem.product.images.first,
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
                    '${cartItem.product.brand} - ${cartItem.product.title}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Description
                  Text(
                    cartItem.product.description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Description
                  Text(
                    '\$ ${usCurrency.format(cartItem.product.price)}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () => addQuantity(),
                        icon: const Icon(Icons.add),
                      ),
                      Expanded(
                        child: Container(
                          height: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            cartItem.quantity.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => subsQuantity(),
                        icon: const Icon(Icons.remove),
                      ),
                      IconButton(
                        onPressed: () => deleteCartItem(),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
