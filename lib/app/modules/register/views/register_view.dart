import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/text_form_field_styles.dart';
import '../../../utils/validator.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final registerFormKey = GlobalKey<FormState>();

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
              "Register your \nAccount",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12.0),
            Text(
              "Register your new account",
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
          child: _buildRegisterForm(context),
        ),
      ),
    );
  }

  _buildRegisterForm(BuildContext context) {
    return Form(
      key: registerFormKey,
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
          TextFormField(
            decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
              radius: 6.0,
            ).copyWith(
              hintText: "username",
              filled: true,
              fillColor: AppColors.primaryColor.withOpacity(0.2),
              prefixIcon: const Icon(
                Icons.person,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
            ),
            validator: Validators.usernameValidator,
            controller: controller.usernameController,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
              radius: 6.0,
            ).copyWith(
              hintText: "full name",
              filled: true,
              fillColor: AppColors.primaryColor.withOpacity(0.2),
              prefixIcon: const Icon(
                Icons.person,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
            ),
            validator: Validators.nameValidator,
            controller: controller.nameController,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
              radius: 6.0,
            ).copyWith(
              hintText: "phone number",
              filled: true,
              fillColor: AppColors.primaryColor.withOpacity(0.2),
              prefixIcon: const Icon(
                Icons.person,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
            ),
            validator: Validators.phoneValidator,
            controller: controller.phoneController,
          ),
          const SizedBox(height: 16.0),
          Obx(
            () => TextFormField(
              obscureText: !controller.isPasswordVisible.value,
              decoration: TextFormFieldStyles.kRoundedInputDecorationNoBorder(
                radius: 6.0,
              ).copyWith(
                hintText: "password",
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
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Register",
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
              const Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "Login",
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
