import 'package:c_royal/models/configs.dart';
import 'package:c_royal/models/user_home_data.dart';
import 'package:c_royal/services/api/api_manager.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  var categories = <MarchandCategories>[].obs;
  var recommandations = <Recommandations>[].obs;
  var marchands = <Marchands>[].obs;
  var populaires = <Populaires>[].obs;

  var isHomeLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadDatas();
  }

  loadDatas() async {
    try {
      isHomeLoading.value = true;
      var configs = await ApiManager.getHomeCategories();
      isHomeLoading.value = false;
      if (configs != null) {
        categories.value = configs.config.marchandCategories;
      }
      var homeData = await ApiManager.getHomeData();
      if (homeData != null) {
        if (homeData.content.marchands != null) {
          marchands.value = homeData.content.marchands;
        }
        if (homeData.content.recommandations != null) {
          recommandations.value = homeData.content.recommandations;
        }

        if (homeData.content.populaires != null) {
          populaires.value = homeData.content.populaires;
        }
      }
    } catch (err) {}
  }
}
