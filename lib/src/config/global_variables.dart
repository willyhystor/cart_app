import 'package:logger/logger.dart';

enum Method { post, get, put, delete, patch, download }

final logger = Logger(
  printer: PrettyPrinter(),
);
