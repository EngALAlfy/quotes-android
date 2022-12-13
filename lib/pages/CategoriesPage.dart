import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/models/Category.dart';
import 'package:quotes_app/providers/AdsProvider.dart';
import 'package:quotes_app/providers/CategoriesProvider.dart';
import 'package:quotes_app/screens/CategoryQuotesScreen.dart';
import 'package:quotes_app/utils/Config.dart';
import 'package:quotes_app/widgets/IsEmptyWidget.dart';
import 'package:quotes_app/widgets/IsErrorWidget.dart';
import 'package:quotes_app/widgets/IsLoadingWidget.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    categoriesProvider.getAll(context);

    return Scaffold(
      body: Consumer<CategoriesProvider>(
        builder: (context, value, child) {
          if (value.categories == null) {
            if (value.isError) {
              return IsErrorWidget(
                error: value.error,
              );
            }

            return IsLoadingWidget();
          }

          if (value.categories.isEmpty) {
            return IsEmptyWidget();
          }

          value.categories.insert(1, Category(isAd: true));

          return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (value.categories.elementAt(index).isAd) {
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

              String count = "";
              if (value.categories.elementAt(index).quotes_count == 0) {
                count = " لا يوجد رسايل ";
              } else {
                if (value.categories.elementAt(index).quotes_count < 11) {
                  count = value.categories
                          .elementAt(index)
                          .quotes_count
                          .toString() +
                      " رسايل ";
                } else {
                  count = value.categories
                          .elementAt(index)
                          .quotes_count
                          .toString() +
                      " رساله ";
                }
              }

              return ListTile(
                onTap: () {
                  Provider.of<AdsProvider>(context, listen: false)
                      .getFullScreen();
                  Navigator.push(
                      context,
                      PageTransition(
                          type: Config.PAGE_TRANSITION,
                          child: CategoryQuotesScreen(
                            id: value.categories.elementAt(index).id,
                          )));
                },
                title: Text(
                  value.categories.elementAt(index).name,
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: Text(
                  count,
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.keyboard_arrow_left_rounded),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 5,
              );
            },
            itemCount: value.categories.length,
          );
        },
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
  }
}
