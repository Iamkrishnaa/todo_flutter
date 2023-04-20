import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  static showToastMessage({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }
}
