import 'package:c_royal/models/user_home_data.dart';
import 'package:c_royal/services/db/local_storage.dart';

import 'api_service.dart';

class ApiManager {
  static Future login(Map<String, dynamic> data) async {
    var response;
    try {
      response = await ApiService.request(
        url: "connexion/users/login",
        method: "post",
        body: data,
      );
    } catch (error) {
      print(error);
    }
    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  static Future<UserHomeData> getHomeData() async {
    var response;
    try {
      response = await ApiService.request(url: "content/home", method: "get");
    } catch (error) {
      print(error);
    }
    if (response != null) {
      return UserHomeData.fromJson(response);
    } else {
      return null;
    }
  }

  static Future userUpdateProfil({String nom}) async {
    var userId = storage.read("user_id");
    var response;
    try {
      response = await ApiService.request(
        url: "users/profile/update",
        body: <String, dynamic>{
          "user_id": userId,
          "nom": nom,
        },
        method: "post",
      );
    } catch (error) {
      print(error);
    }
    if (response != null) {
      return UserHomeData.fromJson(response);
    } else {
      return null;
    }
  }
}
