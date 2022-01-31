import 'package:c_royal/models/subscriptions.dart';
import 'package:c_royal/services/api/api_manager.dart';
import 'package:c_royal/settings/utilities.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();

  var userSubscription = Subscriptions().obs;

  @override
  onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    if (storage.read("user_id") != null) {
      try {
        var subscriptions = await ApiManager.viewSubscriptions();
        if (subscriptions != null) {
          userSubscription.value = subscriptions;
        }
      } catch (err) {
        print("error from user loadData statment");
      }
    }
  }
}
