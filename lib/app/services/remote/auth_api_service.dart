import 'package:todo/app/consts/app_apis.dart';
import 'package:todo/app/data/models/register_request.dart';
import 'package:http/http.dart' as http;

class AuthApiService {
  Future register(RegisterRequest registerRequest) async {
    try {
      var url = Uri.parse("$baseURL${AppApis.register}");
      http.Response response = await http.post(
        url,
        body: RegisterRequest.registerRequestToJson(registerRequest),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
