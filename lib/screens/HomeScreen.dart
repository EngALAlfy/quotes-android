import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/pages/CategoriesPage.dart';
import 'package:quotes_app/providers/AdsProvider.dart';
import 'package:quotes_app/providers/UtilsProvider.dart';
import 'package:quotes_app/screens/AllQuotesScreen.dart';
import 'package:quotes_app/screens/SavedQuotesScreen.dart';
import 'package:quotes_app/utils/Config.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:social_share/social_share.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final version = "0.0.4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Icon(Icons.messenger_outline_rounded),
        actions: [
          IconButton(
              icon: Image.asset("assets/images/menu.png"),
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              }),
        ],
        title: Text(
          "افضل حالات و رسايل",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 60),
              child: ListTile(
                title: Text(
                  "#بوستاتي",
                  style: TextStyle(fontSize: 30),
                ),
                subtitle: Text(
                  "بوستات وحالات رسايل واقتباسات",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Divider(),
                  ListTile(
                    onTap: () {

                      Provider.of<AdsProvider>(context, listen: false)
                          .getFullScreen();
                      Navigator.push(
                          context,
                          PageTransition(
                              type: Config.PAGE_TRANSITION,
                              child: AllQuotesScreen()));
                    },
                    title: Text(
                      "كل الرسايل",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    leading: Icon(Icons.messenger_outline_rounded),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Provider.of<AdsProvider>(context, listen: false)
                          .getFullScreen();
                      Navigator.push(
                          context,
                          PageTransition(
                              type: Config.PAGE_TRANSITION,
                              child: SavedQuotesScreen()));
                    },
                    title: Text(
                      "المحفوظات",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    leading: Icon(Icons.offline_pin_sharp),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () async {
                      if (await InAppReview.instance.isAvailable()) {
                        await InAppReview.instance.requestReview();
                      } else {
                        await InAppReview.instance.openStoreListing();
                      }
                    },
                    title: Text(
                      "تقييم",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    leading: Icon(Icons.star_border_outlined),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      SocialShare.shareOptions(
                          " استمتع وشارك اجمل الرسايل  والبوستات الحزينه وحالات الحب والغرام مع تطبيق بوستاتي https://play.google.com/store/apps/details?id=com.alalfy.quotes_app \n");
                    },
                    title: Text(
                      "مشاركة",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    leading: Icon(Icons.share),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      SystemNavigator.pop(animated: true);
                    },
                    title: Text(
                      "خروج",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    leading: Icon(Icons.logout),
                  ),
                  Consumer<AdsProvider>(
                    builder: (context, value, child) {
                      if (value.noInternet) {
                        return Container(
                          width: 0,
                          height: 0,
                        );
                      } else {
                        return value.getBanner(
                            size: AdmobBannerSize.LARGE_BANNER);
                      }
                    },
                  ),
                ],
              ),
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  " الاصدار $version ",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              onDoubleTap: () async {
                UtilsProvider utils = Provider.of(context, listen: false);
                bool showErrors = await utils.checkShowErrors();
                Alert(
                    context: context,
                    title: "عرض الاخطاء",
                    desc:
                        "نظام عرض الاخطاء يتيح لك عرض تفاصيل الاخطاء لايجاد حل لها مع المطور",
                    buttons: [
                      DialogButton(
                          child: Text(showErrors ? "تعطيل" : "تشغيل",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white)),
                          onPressed: () async {
                            await utils.setShowErrors(!showErrors);
                            Navigator.of(context).pop();
                          }),
                    ]).show();
              },
            ),
          ],
        ),
      ),
      body: CategoriesPage(),
    );
  }
}
