import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/app/consts/app_colors.dart';
import 'package:todo/app/consts/text_form_field_styles.dart';
import 'package:todo/app/routes/app_pages.dart';
import 'package:todo/app/utils/validator.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopSection(context),
            _buildFormSection(context),
          ],
        ),
      ),
    );
  }

  _buildTopSection(BuildContext context) {
    return SizedBox(
      height: Get.size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign in to your \nAccount",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12.0),
            Text(
              "Sign in to your account",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  _buildFormSection(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24.0,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: _buildLoginForm(context),
        ),
      ),
    );
  }

  _buildLoginForm(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
              radius: 6.0,
            ).copyWith(
              hintText: "your-mail@email.com",
              filled: true,
              fillColor: AppColors.primaryColor.withOpacity(0.2),
              prefixIcon: const Icon(
                Icons.email,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
            ),
            validator: Validators.emailValidator,
            controller: controller.emailController,
          ),
          const SizedBox(height: 16.0),
          Obx(
            () => TextFormField(
              obscureText: !controller.isPasswordVisible.value,
              decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
                radius: 6.0,
              ).copyWith(
                hintText: "Password",
                filled: true,
                fillColor: AppColors.primaryColor.withOpacity(0.2),
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.isPasswordVisible.toggle();
                  },
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
              validator: Validators.passwordValidator,
              controller: controller.passwordController,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot password?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.HOME);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Sign in",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.REGISTER);
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
