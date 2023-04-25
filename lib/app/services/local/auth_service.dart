import 'package:get/get.dart';
import 'package:todo/app/services/local/storage_service.dart';

import '../../routes/app_pages.dart';

class AuthService extends GetxService {
  Future logout() async {
    StorageService storageService = Get.find();
    await storageService.deleteAccessToken();
    await storageService.deleteRefreshToken();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
