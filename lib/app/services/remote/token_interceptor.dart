import 'dart:convert';

import 'package:get/get.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/retry_policy.dart';
import 'package:todo/app/services/local/storage_service.dart';
import 'package:todo/app/services/remote/refresh_token_api_service.dart';
import 'package:http/http.dart' as http;
import '../../routes/app_pages.dart';

class TokenInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    StorageService storageService = Get.find();
    String? accessToken = storageService.getAccesToken();

    data.headers["Content-Type"] = 'application/json';
    data.headers["Authorization"] = 'Bearer $accessToken';

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}

class RefreshTokenInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    StorageService storageService = Get.find();
    String? refreshToken = storageService.geRefreshToken();

    data.headers["Content-Type"] = 'application/json';
    data.headers["Authorization"] = 'Bearer $refreshToken';

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}

class RefreshTokenretryPolicy extends RetryPolicy {
  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401) {
      try {
        StorageService storageService = Get.find();

        String? refreshToken = storageService.geRefreshToken();

        if (refreshToken == null) {
          return false;
        }

        http.Response response = await RefreshTokenApiService().refreshToken();
        var decodedResponse = jsonDecode(response.body);

        storageService.storeAccessToken(
            accessToken: decodedResponse["accessToken"]);
        return true;
      } catch (e) {
        Get.offAllNamed(Routes.LOGIN);
        return false;
      }
    }
    return false;
  }
}
