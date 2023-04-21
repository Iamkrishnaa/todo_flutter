import 'package:http_interceptor/http/http.dart';
import 'package:todo/app/services/remote/token_interceptor.dart';
import 'package:http/http.dart' as http;
import '../../consts/app_apis.dart';

class RefreshTokenApiService {
  static final client = InterceptedClient.build(
    interceptors: [
      RefreshTokenInterceptor(),
    ],
  );

  Future refreshToken() async {
    try {
      var url = Uri.parse(AppApis.refreshToken);
      http.Response response = await client.get(
        url,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
