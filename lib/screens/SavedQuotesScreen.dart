import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/providers/AdsProvider.dart';
import 'package:quotes_app/providers/DatabaseProvider.dart';
import 'package:quotes_app/widgets/IsEmptyWidget.dart';
import 'package:quotes_app/widgets/IsErrorWidget.dart';
import 'package:quotes_app/widgets/IsLoadingWidget.dart';
import 'package:quotes_app/widgets/QuoteWidget.dart';

class SavedQuotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatabaseProvider databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    databaseProvider.getSavedQuotes(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المحفوظات",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
        ),
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, value, child) {
          if (value.savedQuotes == null) {
            if (value.isError) {
              return IsErrorWidget(
                error: value.error,
              );
            }

            return IsLoadingWidget();
          }

          if (value.savedQuotes.isEmpty) {
            return IsEmptyWidget();
          }

          return ListView.builder(
            itemBuilder: (context, index) {

              if (value.savedQuotes.elementAt(index).isAd) {
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
                quote: value.savedQuotes.elementAt(index),
                isSaved: true,
                databaseProvider: value,
              );
            },
            itemCount: value.savedQuotes.length,
          );
        },
      ),
    );
  }
}
