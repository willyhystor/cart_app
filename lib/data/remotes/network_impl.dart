import 'package:cart_app/domain/interfaces/remotes/network.dart';
import 'package:cart_app/shared/global_variables.dart';
import 'package:dio/dio.dart';

class NetworkImpl implements INetwork {
  late Dio _dio;

  void init() {
    _dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    )..interceptors.add(
        InterceptorsWrapper(
          onRequest: (requestOptions, handler) {
            logger.i("REQUEST [${requestOptions.method}] =>"
                "\nPATH: ${requestOptions.path}"
                "\nHEADERS: ${requestOptions.headers}"
                "\nPAYLOAD: ${requestOptions.data}");
            return handler.next(requestOptions);
          },
          onResponse: (response, handler) {
            logger.i("RESPONSE [${response.statusCode}] =>"
                "\nDATA: ${response.data}");
            return handler.next(response);
          },
          onError: (err, handler) {
            logger.i("Error[${err.response?.statusCode}] =>"
                "\nERROR: ${err.response?.data}");
            return handler.next(err);
          },
        ),
      );
  }

  @override
  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
  }) async {
    // SETUP DIO
    init();

    // EXECUTE CONNECTION
    Response response;
    try {
      response = await _dio.get(url);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(response);
      }
    } on DioError catch (e) {
      logger.e(e);

      throw Exception(e);
    } catch (e) {
      logger.e(e);

      throw Exception("Something went wrong");
    }
  }
}
