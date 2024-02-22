import 'package:flutter_toturial/utils/api/app_url.dart';
import 'package:flutter_toturial/utils/api/dio_client.dart';
import 'package:flutter_toturial/utils/helper/dialog_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GenerateController extends GetxController {
  final storage = GetStorage();

  getTextGenerate(String text, String sender) async {
    try {
      var url = '${AppUrl.baseURL}speech/generateText';
      var data = {
        "role": sender,
        "content": text,
      };
      var response = await DioClient.post(url, data, loading: false);
      if (response['status'] == "ok") {
        return response["results"];
      } else {
        DialogHelper.showErrorDialog(description: response.toString());
        return null;
      }
    } catch (e) {
      DialogHelper.showErrorDialog(description: e.toString());
    }
  }
}
