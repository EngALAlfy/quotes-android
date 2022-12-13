import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/models/Quote.dart';
import 'package:quotes_app/providers/AdsProvider.dart';
import 'package:quotes_app/providers/QuotesProvider.dart';
import 'package:quotes_app/utils/Config.dart';
import 'package:quotes_app/widgets/IsEmptyWidget.dart';
import 'package:quotes_app/widgets/IsErrorWidget.dart';
import 'package:quotes_app/widgets/IsLoadingWidget.dart';
import 'package:quotes_app/widgets/QuoteWidget.dart';

class AllQuotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuotesProvider quotesProvider =
        Provider.of<QuotesProvider>(context, listen: false);

    quotesProvider.from = 0;
    quotesProvider.count = 0;
    quotesProvider.getAll(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "كل الرسائل والبوستات",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
        ),
      ),
      body: Consumer<QuotesProvider>(
        builder: (context, value, child) {
          if (value.quotes == null) {
            if (value.isError) {
              return IsErrorWidget(
                error: value.error,
              );
            }

            return IsLoadingWidget();
          }

          if (value.quotes.isEmpty) {
            return IsEmptyWidget();
          }


          return LazyLoadScrollView(
            child: ListView.builder(
              itemCount: value.quotes.length - value.adsCount < value.count
                  ? value.quotes.length + 1
                  : value.quotes.length,
              itemBuilder: (context, index) {

                if (index == value.quotes.length &&
                    value.quotes.length - value.adsCount < value.count) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (value.quotes.elementAt(index).isAd) {
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
                  quote: value.quotes.elementAt(index),
                );
              },
            ),
            //isLoading: value.quotes.length <= value.count + 1,
            onEndOfPage: () {
              if (value.quotes.length - value.adsCount < value.count) {
                value.from = value.from + Config.QUOTES_COUNT;
                value.getAll(context);
              }
            },
          );
        },
      ),
    );
  }
}
