import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/data/models/register_request.dart';
import 'package:todo/app/services/remote/auth_api_service.dart';
import 'package:http/http.dart' as http;

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
    } catch (e) {
      log(e.toString());
    }
  }
}
