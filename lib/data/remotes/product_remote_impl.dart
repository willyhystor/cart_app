import 'package:cart_app/domain/interfaces/remotes/network.dart';
import 'package:cart_app/domain/interfaces/remotes/product_remote.dart';
import 'package:cart_app/domain/models/product.dart';
import 'package:cart_app/shared/global_variables.dart';
import 'package:cart_app/shared/remote_constants.dart';
import 'package:get/get.dart';

class ProductRemoteImpl implements IProductRemote {
  final _network = Get.find<INetwork>();

  @override
  Future<List<Product>> getProducts() async {
    final response = await _network.request(
        url: RemoteConstants.products, method: Method.get);

    final products = <Product>[];

    for (final productMap in response.data['products']) {
      products.add(Product.fromMap(productMap));
    }

    return products;
  }
}
