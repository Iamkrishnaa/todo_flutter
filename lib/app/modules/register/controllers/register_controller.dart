import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/data/models/register_request.dart';
import 'package:todo/app/routes/app_pages.dart';
import 'package:todo/app/services/remote/auth_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:todo/app/utils/helpers.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();

  RxBool isPasswordVisible = false.obs;

  registerUser() async {
    RegisterRequest registerRequest = RegisterRequest(
      username: usernameController.text,
      password: passwordController.text,
      email: emailController.text,
      fullName: nameController.text,
      phoneNumber: phoneController.text,
    );

    try {
      http.Response response = await AuthApiService().register(registerRequest);
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 201) {
        Helper.showToastMessage(
          message: "Verification link has been sent to your email. ",
        );
        Get.offNamed(Routes.LOGIN);
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
