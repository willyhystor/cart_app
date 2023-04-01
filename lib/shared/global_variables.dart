import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

enum Method { post, get, put, delete, patch, download }

enum ViewStatus { loading, idle }

final logger = Logger(
  printer: PrettyPrinter(),
);

final usCurrency = NumberFormat("#,##0", "en_US");
