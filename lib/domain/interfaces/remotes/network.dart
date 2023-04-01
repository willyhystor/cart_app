import 'package:cart_app/shared/global_variables.dart';

abstract class INetwork {
  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
  });
}
