import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseProvider extends ChangeNotifier {
  String error;

  catchError(context, err) async {
    EasyLoading.showError("حدث خطأ ما !");
    if (err is DioError) {
      switch (err.type) {
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
          error = "انتهي وقت الطلب";
          break;
        case DioErrorType.RESPONSE:
          error = err.response == null ?"غير قادر علي الوصول للسيرفر" : " خطأ في السيرفر \n كود الحالة : ${err.response.statusCode} ";
          break;
        case DioErrorType.CANCEL:
          error = "تم الغاء الطلب";
          break;
        case DioErrorType.DEFAULT:
        default:
          error = "غير قادر علي الاتصال بالسيرفر";
          break;
      }

    } else {
      error = "خطا غير معروف بالسيرفر";
    }

    if (await checkShowErrors()) {
      Alert(
              context: context,
              title: "خطأ مفصل",
              desc: err.toString(),
              type: AlertType.error)
          .show();
    }

    print(err);
  }

  Future<bool> checkInternet() async {
    return await Connectivity().checkConnectivity() != ConnectivityResult.none;
  }

  Future<bool> setPermissions() async {
    return Permission.storage.request().isGranted;
  }

  Future<bool> checkPermissions() async {
    var storagePermission = await Permission.storage.request();

    if (storagePermission.isDenied) {
      EasyLoading.showError("لا يمكن تشغيل التطبيق بدون منح الاذونات");
      return false;
    } else {
      return true;
    }
  }

  Future<bool> checkShowErrors() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("showErrors") ?? false;
  }

  Future<bool> setShowErrors(show) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool("showErrors", show);
  }
}
