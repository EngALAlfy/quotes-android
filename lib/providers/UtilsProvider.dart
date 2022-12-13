import 'package:connectivity/connectivity.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:quotes_app/providers/BaseProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UtilsProvider extends BaseProvider {
  bool isLoaded = false;
  bool noInternet = false;

  bool isFirstOpen = true;

  bool isReviewed = false;

  bool isError = false;

  UtilsProvider() {
    init();
    addInternetListener();
  }

  init() async {
    await checkFirstOpen();
    noInternet = !await checkInternet();
    await checkReviewed();
    isLoaded = true;
    notifyListeners();
  }

  checkFirstOpen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isFirstOpen = preferences.getBool("isFirstOpen2") ?? true;
  }

  setFirstOpen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isFirstOpen2", false);
    await checkFirstOpen();
    notifyListeners();
  }

  addInternetListener() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        //noInternet = true;
        EasyLoading.showError('لا يوجد انترنت');
      } else {
        //noInternet = false;
      }

      //notifyListeners();
    });
  }


  checkReviewed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isReviewed = preferences.getBool("isReviewed1") ?? false;
  }

  setReviewed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isReviewed1", true);
    await checkReviewed();
    notifyListeners();
  }
}

