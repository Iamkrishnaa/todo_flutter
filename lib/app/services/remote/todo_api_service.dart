import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:todo/app/consts/app_apis.dart';
import 'package:todo/app/services/remote/token_interceptor.dart';

class TodoApiService {
  static final client = InterceptedClient.build(
    interceptors: [
      TokenInterceptor(),
    ],
    retryPolicy: RefreshTokenretryPolicy(),
  );

  Future getAllTodos() async {
    try {
      http.Response response = await client.get(
        Uri.parse(AppApis.getAllTodos),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
