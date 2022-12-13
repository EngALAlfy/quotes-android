import 'dart:io';

import 'package:ext_storage/ext_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:quotes_app/models/Quote.dart';
import 'package:quotes_app/providers/BaseProvider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseProvider extends BaseProvider {
  String dbName = 'quotes.db';
  String savedStoreName = "saved_quotes";
  Database db;

  List<dynamic> ids;

  List<Quote> savedQuotes;

  bool isError = false;

  int adsCount = 2;

  init(context) async {
    Directory folder;
    if (await checkPermissions()) {
      folder = await checkFolder();
    }

    if (folder == null) {
      return;
    }

    try {
      // File path to a file in the current directory
      String dbPath = folder.path + "/" + dbName;
      DatabaseFactory dbFactory = databaseFactoryIo;

      // We use the database factory to open the database
      db = await dbFactory.openDatabase(dbPath);
    } catch (e) {
      catchError(context, e);
    }
  }

  addQuoteToSaved(context, Quote quote) async {
    await init(context);
    if (db != null) {
      StoreRef savedStore = StoreRef(savedStoreName);
      await savedStore.record(quote.id).put(db, quote.toJson());
      EasyLoading.showSuccess("تم اضافه للمحفوظات");
      getSavedQuotesIds(context);
      getSavedQuotes(context);
    } else {
      EasyLoading.showError("حدث خطأ ما!");
    }
  }

  removeQuoteFromSaved(context, Quote quote) async {
    await init(context);
    if (db != null) {
      StoreRef savedStore = StoreRef(savedStoreName);
      await savedStore.record(quote.id).delete(db);
      EasyLoading.showSuccess("تم الحذف من المحفوظات");
      getSavedQuotesIds(context);
      getSavedQuotes(context);
    } else {
      EasyLoading.showError("حدث خطأ ما!");
    }
  }

  getSavedQuotes(context) async {
    await init(context);
    if (db != null) {
      StoreRef savedStore = StoreRef(savedStoreName);
      var _ids = await savedStore.findKeys(db);
      var quotes = await savedStore.records(_ids).get(db);
      savedQuotes = quotes
          ?.map((e) =>
              e == null ? null : Quote.fromJson(e as Map<String, dynamic>))
          ?.toList();

      if (savedQuotes.isNotEmpty) {
        for (int i = 1; i <= adsCount; i++) {
          int index = (i * 7 - 6) < savedQuotes.length
              ? (i * 7 - 6)
              : savedQuotes.length;
          savedQuotes.insert(index, Quote(isAd: true));
        }
      }

      notifyListeners();
    } else {
      EasyLoading.showError("حدث خطأ ما!");
    }
  }

  getSavedQuotesIds(context) async {
    await init(context);
    if (db != null) {
      StoreRef savedStore = StoreRef(savedStoreName);
      ids = (await savedStore.findKeys(db)).toList();
      notifyListeners();
    } else {
      EasyLoading.showError("حدث خطأ ما!");
    }
  }

  checkFolder() async {
    String path = await ExtStorage.getExternalStorageDirectory();
    Directory folder = Directory(path + "/حالات ورسايل/.database");

    if (!folder.existsSync()) {
      await folder.create(recursive: true);
    }

    return folder;
  }
}
