import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/data/models/login/login_request.dart';
import 'package:http/http.dart' as http;
import 'package:todo/app/routes/app_pages.dart';
import 'package:todo/app/services/local/storage_service.dart';
import 'package:todo/app/services/remote/auth_api_service.dart';

import '../../../utils/helpers.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;

  loginUser() async {
    try {
      LoginRequest loginRequest = LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      );

      http.Response response = await AuthApiService().login(loginRequest);
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        StorageService storageService = Get.find();
        await storageService.storeAccessToken(
            accessToken: decodedResponse["accessToken"]);

        await storageService.storeRefreshToken(
            refreshToken: decodedResponse["refreshToken"]);

        Get.offAllNamed(Routes.HOME);
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        Helper.showToastMessage(message: decodedResponse["message"]);
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      Helper.showToastMessage(message: "Something went wrong.");
    }
  }
}
