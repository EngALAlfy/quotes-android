import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:quotes_app/models/Category.dart';
import 'package:quotes_app/providers/BaseProvider.dart';
import 'package:quotes_app/utils/Config.dart';

class CategoriesProvider extends BaseProvider {
  Category category;
  List<Category> categories;

  bool isError = false;

  getAll(context) async {
    try {

      if (!await checkInternet()) {
        EasyLoading.showError("لا يوجد انترنت");
        isError = true;
        notifyListeners();
        return;
      }

      Response response =
          await Dio().get(Config.API_URL + "/categories/get/all");

      if (response.data["success"] == true) {
        categories = (response.data["data"]["categories"] as List)
            ?.map((e) =>
                e == null ? null : Category.fromJson(e as Map<String, dynamic>))
            ?.toList();

        isError = false;
      } else {
        EasyLoading.showError("خطأ من السيرفر\n كود الخطأ : " +
            response.data['err']['code']?.toString());

        isError = true;
      }
    } catch (e) {
      isError = true;
      catchError(context, e);
    }

    notifyListeners();
  }

  get(context, id) async {
    try {

      if (!await checkInternet()) {
        EasyLoading.showError("لا يوجد انترنت");
        isError = true;
        notifyListeners();
        return;
      }

      Response response =
          await Dio().get(Config.API_URL + "/categories/get/$id");

      if (response.data["success"] == true) {
        category = Category.fromJson(response.data["data"]["category"]);
        isError = false;
      } else {
        EasyLoading.showError("خطأ من السيرفر\n كود الخطأ : " +
            response.data['err']['code']?.toString());
        isError = true;
      }
    } catch (e) {
      isError = true;
      catchError(context, e);
    }
    notifyListeners();
  }
}
