import 'package:c_royal/models/configs.dart';
import 'package:c_royal/models/gallery.dart';
import 'package:c_royal/models/subscriptions.dart';
import 'package:c_royal/models/user_home_data.dart';
import 'package:c_royal/services/db/local_storage.dart';

import 'api_service.dart';

class ApiManager {
  static Future login({Map<String, dynamic> data}) async {
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

  static Future<Configs> getHomeCategories() async {
    var response;
    try {
      response = await ApiService.request(url: "content/config", method: "get");
    } catch (error) {
      print(error);
    }
    if (response != null) {
      return Configs.fromJson(response);
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

  static Future subscribe(
      {String subscribeAmountId, String subscribeId}) async {
    var userId = storage.read("user_id");
    var response;
    try {
      if (subscribeId.isEmpty) {
        response = await ApiService.request(
          url: "users/abonnements/abonner",
          body: <String, dynamic>{
            "user_id": userId,
            "abonnement_tarif_id": int.parse(subscribeAmountId),
          },
          method: "post",
        );
      } else {
        response = await ApiService.request(
          url: "users/abonnements/abonner",
          body: <String, dynamic>{
            "user_id": userId,
            "abonnement_tarif_id": int.parse(subscribeAmountId),
            "abonnement_id": int.parse(subscribeId)
          },
          method: "post",
        );
      }
    } catch (error) {
      print(error);
    }
    print(response);
    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  static Future<Subscriptions> viewSubscriptions() async {
    var userId = storage.read("user_id");
    var response;
    try {
      response = await ApiService.request(
        url: "users/abonnements/voir",
        body: <String, dynamic>{
          "user_id": userId,
        },
        method: "post",
      );
    } catch (error) {
      print(error);
    }
    if (response != null) {
      return Subscriptions.fromJson(response);
    } else {
      return null;
    }
  }

  static Future<MarchandsGallery> viewGalleries({marchandId}) async {
    var response;
    try {
      response = await ApiService.request(
        url: "content/marchand",
        body: <String, dynamic>{
          "marchand_id": marchandId,
        },
        method: "post",
      );
    } catch (error) {
      print(error);
    }
    if (response != null) {
      return MarchandsGallery.fromJson(response);
    } else {
      return null;
    }
  }
}
