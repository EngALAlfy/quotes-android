import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:quotes_app/models/Category.dart';
import 'package:quotes_app/models/Quote.dart';
import 'package:quotes_app/providers/BaseProvider.dart';
import 'package:quotes_app/utils/Config.dart';

class QuotesProvider extends BaseProvider {
  int from = 0;
  int count = 0;

  int adsCount = 2;

  List<Quote> quotes;

  Category category;

  bool isError = false;

  Future<void> getAll(context) async {
    try {
      if (!await checkInternet()) {
        EasyLoading.showError("لا يوجد انترنت");
        isError = true;
        notifyListeners();
        return;
      }

      Response response =
          await Dio().get(Config.API_URL + "/quotes/get/all/$from");

      if (response.data["success"] == true) {
        count = response.data["data"]["count"] as int;

        if (quotes != null && from != 0) {
          quotes.addAll((response.data["data"]["quotes"] as List)
              ?.map((e) =>
                  e == null ? null : Quote.fromJson(e as Map<String, dynamic>))
              ?.toList());
        } else {
          quotes = (response.data["data"]["quotes"] as List)
              ?.map((e) =>
                  e == null ? null : Quote.fromJson(e as Map<String, dynamic>))
              ?.toList();

          if(quotes.isNotEmpty){
            for(int i = 1; i <= adsCount ;i++){
              int index = (i*7-6) < quotes.length ?(i*7-6) : quotes.length;
              quotes.insert(index, Quote(isAd: true));
            }
          }

        }

        isError = false;
      } else {
        isError = true;
        EasyLoading.showError("خطأ من السيرفر\n كود الخطأ : " +
            response.data['err']['code']?.toString());
      }
    } catch (e) {
      isError = true;
      catchError(context, e);
    }
    notifyListeners();
  }

  Future<void> getCategory(context, id) async {
    try {
      if (!await checkInternet()) {
        EasyLoading.showError("لا يوجد انترنت");
        isError = true;
        notifyListeners();
        return;
      }

      Response response =
          await Dio().get(Config.API_URL + "/quotes/get/category/$id/$from");

      if (response.data["success"] == true) {
        if (from == 0) {
          category = Category.fromJson(response.data["data"]["category"]);
        }

        if (category != null) {
          if (category.quotes != null && from != 0) {
            category.quotes.addAll((response.data["data"]["quotes"] as List)
                ?.map((e) => e == null
                    ? null
                    : Quote.fromJson(e as Map<String, dynamic>))
                ?.toList());
          } else {
            category.quotes = (response.data["data"]["quotes"] as List)
                ?.map((e) => e == null
                    ? null
                    : Quote.fromJson(e as Map<String, dynamic>))
                ?.toList();

            if(category.quotes != null && category.quotes.isNotEmpty){
              for(int i = 1; i <= adsCount ;i++){
                int index = (i*7-6) < category.quotes.length ?(i*7-6) : category.quotes.length;
                category.quotes.insert(index, Quote(isAd: true));
              }
            }

          }

          isError = false;
        } else {
          isError = true;
          EasyLoading.showError("حدث خطأ ما !");
        }
      } else {
        isError = true;
        EasyLoading.showError("خطأ من السيرفر\n كود الخطأ : " +
            response.data['err']['code']?.toString());
      }

    } catch (e) {
      isError = true;
      catchError(context, e);
    }

    notifyListeners();
  }
}
