import 'package:get/get.dart';
import 'package:todo/app/consts/app_apis.dart';
import 'package:todo/app/data/models/login/login_request.dart';
import 'package:todo/app/data/models/register_request.dart';
import 'package:http/http.dart' as http;
import 'package:todo/app/services/local/storage_service.dart';

class AuthApiService {
  StorageService storageService = Get.find();
  Future register(RegisterRequest registerRequest) async {
    try {
      var url = Uri.parse(AppApis.register);
      http.Response response = await http.post(
        url,
        body: RegisterRequest.registerRequestToJson(registerRequest),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${storageService.getAccesToken()}"
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future login(LoginRequest loginRequest) async {
    try {
      var url = Uri.parse(AppApis.login);
      http.Response response = await http.post(
        url,
        body: LoginRequest.loginRequestToJson(loginRequest),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
