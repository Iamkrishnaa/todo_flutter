import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/app/services/local/storage_service.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  StorageService storageService = Get.put(StorageService());
  await storageService.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
