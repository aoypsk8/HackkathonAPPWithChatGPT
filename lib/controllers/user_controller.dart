import 'package:flutter_toturial/utils/api/app_url.dart';
import 'package:flutter_toturial/utils/api/dio_client.dart';
import 'package:flutter_toturial/utils/helper/dialog_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

class UserController extends GetxController {
  final storage = GetStorage();

  login(String username, String password) async {
    try {
      var url = '${AppUrl.baseURL}auth/login';
      var data = {
        "username": username,
        "password": password,
      };
      // await Future.delayed(Duration(seconds: 2));
      var response = await DioClient.post(url, data);

      if (response['status'] == "ok") {
        //showSuccessDialog
        storage.write("token", response['token']);

        Get.offNamedUntil('/nav', (route) => false);
      } else {
        DialogHelper.showErrorDialog(description: response['message']);
      }
    } catch (e) {
      DialogHelper.showErrorDialog(description: e.toString());
    }
  }

  register(String username, String password, String email) async {
    try {
      var url = '${AppUrl.baseURL}auth/register';
      var data = {
        "username": username,
        "password": password,
        "email": email,
      };
      var response = await DioClient.post(url, data);
      if (response['status'] == "ok") {
        //showSuccessDialog
        DialogHelper.showSuccessDialog(
          description: response['message'],
          onClose: () => Get.toNamed('/login'),
        );
      } else {
        DialogHelper.showErrorDialog(description: response['message']);
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    bool confirm = await DialogHelper.confirmYseOrNo(
      title: "ຄຳເຕື່ອນ",
      description: "ທ່ານຕ້ອງການອອກຈາກລະບົບ ຫຼື ບໍ ?",
    );
    if (confirm) {
      storage.remove("token");
      Get.offNamedUntil('/', (route) => false);
    }
  }
}
