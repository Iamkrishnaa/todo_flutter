import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  late SharedPreferences sharedPreferences;

  Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future storeAccessToken({required String accessToken}) async {
    await sharedPreferences.setString("accessToken", accessToken);
  }

  getAccesToken() {
    return sharedPreferences.getString("accessToken");
  }

  Future storeRefreshToken({required String refreshToken}) async {
    await sharedPreferences.setString("refreshToken", refreshToken);
  }

  geRefreshToken() {
    return sharedPreferences.getString("refreshToken");
  }
}
