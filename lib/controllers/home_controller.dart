import 'package:flutter_toturial/utils/api/app_url.dart';
import 'package:flutter_toturial/utils/api/dio_client.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Map<String, dynamic>> unitsData = RxList<Map<String, dynamic>>();
  RxList showTextColumn = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await fetchHomeData();
    showTextColumn.value =
        List.generate(unitsData.length, (index) => false).obs;

    // print(showTextColumn.value);
  }

  fetchHomeData() async {
    try {
      var url = '${AppUrl.baseURL}lessons/getLessonsByUnit';

      var response = await DioClient.get(url, loading: false);
      unitsData.value = List<Map<String, dynamic>>.from(response['units']);
    } catch (e) {
      print(e);
    }
  }
}
