import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/providers/AdsProvider.dart';
import 'package:quotes_app/providers/DatabaseProvider.dart';
import 'package:quotes_app/providers/QuotesProvider.dart';
import 'package:quotes_app/utils/Config.dart';
import 'package:quotes_app/widgets/IsEmptyWidget.dart';
import 'package:quotes_app/widgets/IsErrorWidget.dart';
import 'package:quotes_app/widgets/IsLoadingWidget.dart';
import 'package:quotes_app/widgets/QuoteWidget.dart';

class CategoryQuotesScreen extends StatelessWidget {
  final String id;

  const CategoryQuotesScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuotesProvider quotesProvider =
        Provider.of<QuotesProvider>(context, listen: false);
    DatabaseProvider databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);

    databaseProvider.getSavedQuotesIds(context);

    quotesProvider.from = 0;
    quotesProvider.count = 0;
    quotesProvider.getCategory(context, id);

    return Consumer<QuotesProvider>(
      builder: (context, value, child) {
        if (value.category == null) {
          if (value.isError) {
            return IsErrorWidget(
              error: value.error,
            );
          }

          return IsLoadingWidget();
        }

        if (value.category.quotes == null) {
          return IsEmptyWidget();
        }

        if (value.category.quotes.isEmpty) {
          return IsEmptyWidget();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              value.category.name ?? "لا يوجد اسم",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
          ),
          body: LazyLoadScrollView(
            onEndOfPage: () {
              if (value.category.quotes.length - value.adsCount <
                  value.category.quotes_count) {
                value.from = value.from + Config.QUOTES_COUNT;
                value.getCategory(context, id);
              }
            },
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: (context, index) {
                if (index == value.category.quotes.length &&
                    value.category.quotes.length - value.adsCount <
                        value.category.quotes_count) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (value.category.quotes.elementAt(index).isAd) {
                  return Consumer<AdsProvider>(
                    builder: (context, value, child) {
                      if (value.noInternet) {
                        return Container(
                          width: 0,
                          height: 0,
                        );
                      } else {
                        return value.getBanner(
                            size: AdmobBannerSize.MEDIUM_RECTANGLE);
                      }
                    },
                  );
                }

                return QuoteWidget(
                  quote: value.category.quotes.elementAt(index),
                );
              },
              itemCount: value.category.quotes.length - value.adsCount <
                      value.category.quotes_count
                  ? value.category.quotes.length + 1
                  : value.category.quotes.length,
            ),
          ),
          bottomNavigationBar: Consumer<AdsProvider>(
            builder: (context, value, child) {
              if (value.noInternet) {
                return Container(
                  width: 0,
                  height: 0,
                );
              } else {
                return value.getBanner();
              }
            },
          ),
        );
      },
    );
  }
}
