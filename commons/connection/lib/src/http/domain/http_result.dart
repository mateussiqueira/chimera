import 'package:http/http.dart';

abstract class HttpResult {
  Future<dynamic> handle(Response response);
}
