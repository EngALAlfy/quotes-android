import 'dart:io';
import 'dart:ui';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/models/Quote.dart';
import 'package:quotes_app/pages/FontCustomPage.dart';
import 'package:quotes_app/providers/AdsProvider.dart';
import 'package:quotes_app/providers/DatabaseProvider.dart';
import 'package:quotes_app/utils/Config.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';

class QuoteWidget extends StatefulWidget {
  final Quote quote;
  final bool isSaved;
  final DatabaseProvider databaseProvider;

  QuoteWidget(
      {Key key, this.quote, this.isSaved = false, this.databaseProvider})
      : super(key: key);

  @override
  QuoteWidgetState createState() => QuoteWidgetState();
}

class QuoteWidgetState extends State<QuoteWidget> {
  ScreenshotController screenshotController = ScreenshotController();
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            elevation: 5,
            borderOnForeground: true,
            margin: EdgeInsets.only(bottom: 5, top: 10, left: 10, right: 10),
            child: Container(
              child: Column(
                children: [
                  quoteBody(),
                  iconsBar(context),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          AdmobBanner(
            adUnitId: Config.AD_BANNER_ID,
            adSize: AdmobBannerSize.BANNER,
          )
        ],
      ),
    );
  }

  Widget iconsBar(context) {
    var isNew = DateTime.parse(widget.quote.createdAt)
        .add(Duration(days: 5))
        .isAfter(DateTime.now());

    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        saveIcon(),
        IconButton(
            icon: Icon(Icons.font_download_outlined),
            onPressed: () {
              Provider.of<AdsProvider>(context, listen: false).getReward();

              fontCustom(context);
            }),
        IconButton(
            icon: Icon(Icons.copy),
            onPressed: () {
              SocialShare.copyToClipboard(text ?? "لا يوجد نص")
                  .then((value) => EasyLoading.showSuccess("تم النسخ"));
            }),
        IconButton(
            icon: Icon(FontAwesome.download),
            onPressed: () {
              EasyLoading.show();
              var pixel = 2.0;
              if (window.devicePixelRatio > 2) {
                pixel = window.devicePixelRatio;
              }

              Provider.of<AdsProvider>(context, listen: false).getFullScreen();
              screenshotController
                  .capture(pixelRatio: pixel)
                  .then((File image) async {
                await saveImageFile(image);
              });
            }),
        IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              SocialShare.shareOptions(text);
            }),
        IconButton(
            icon: Icon(FontAwesome.whatsapp),
            onPressed: () {
              Provider.of<AdsProvider>(context, listen: false).getFullScreen();
              SocialShare.shareWhatsapp(text);
            }),
        isNew
            ? Image.asset(
                "assets/images/new.png",
                width: 40,
                height: 40,
              )
            : Container(
                width: 0,
                height: 0,
              )
        /*

    IconButton(icon: Icon(FontAwesome.instagram), onPressed: () {
          EasyLoading.show();
          screenshotController.capture().then((File image) async {
            File file = await saveImageFile(image);
            SocialShare.shareInstagramStory(file.path, "#fff" , "#00000" , "https://play.google.com/store/apps/details?id=com.alalfy.quotes_app");
          });
        }),


        IconButton(icon: Icon(FontAwesome.telegram), onPressed: () {
          SocialShare.shareTelegram(quote.text);
        }),

        IconButton(icon: Icon(FontAwesome.twitter), onPressed: () {
          SocialShare.shareTwitter(quote.text);
        }),

        IconButton(icon: Icon(MaterialIcons.sms), onPressed: () {
          SocialShare.shareSms(quote.text);
        }),

         */
      ],
    );
  }

  Widget quoteBody() {
    switch (widget.quote.fontDeco) {
      case "1":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip1.containsKey(e)) {
            return Config.flip1[e];
          }
          return e;
        }).join();
        break;
      case "2":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip2.containsKey(e)) {
            return Config.flip2[e];
          }
          return e;
        }).join();
        break;
      case "3":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip3.containsKey(e)) {
            return Config.flip3[e];
          }
          return e;
        }).join();
        break;
      case "4":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip4.containsKey(e)) {
            return Config.flip4[e];
          }
          return e;
        }).join();
        break;
      case "5":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip5.containsKey(e)) {
            return Config.flip5[e];
          }
          return e;
        }).join();
        break;
      case "6":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip6.containsKey(e)) {
            return Config.flip6[e];
          }
          return e;
        }).join();
        break;
      case "7":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip7.containsKey(e)) {
            return Config.flip7[e];
          }
          return e;
        }).join();
        break;
      case "8":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip8.containsKey(e)) {
            return Config.flip8[e];
          }
          return e;
        }).join();
        break;
      case "9":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip9.containsKey(e)) {
            return Config.flip9[e];
          }
          return e;
        }).join();
        break;
      case "10":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip10.containsKey(e)) {
            return Config.flip10[e];
          }
          return e;
        }).join();
        break;
      case "11":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip11.containsKey(e)) {
            return Config.flip11[e];
          }
          return e;
        }).join();
        break;
      case "12":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip12.containsKey(e)) {
            return Config.flip12[e];
          }
          return e;
        }).join();
        break;
      case "13":
        text = widget.quote.text.characters.map((e) {
          if (Config.flip13.containsKey(e)) {
            return Config.flip13[e];
          }
          return e;
        }).join();
        break;
      case "none":
      default:
        text = widget.quote.text;
    }

    return Screenshot(
      controller: screenshotController,
      child: Container(
        decoration: BoxDecoration(
          color: widget.quote.bgColor ?? Colors.white70,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4), topRight: Radius.circular(4)),
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(FontAwesome.quote_right,
                    color: widget.quote.fontColor ?? Colors.black),
              ],
            ),
            Center(
              child: Text(
                text ?? "لا يوجد نص",
                style: TextStyle(
                    fontSize: widget.quote.fontSize ?? 35,
                    fontFamily: widget.quote.fontName ?? "hor",
                    color: widget.quote.fontColor ?? Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(FontAwesome.quote_left,
                    color: widget.quote.fontColor ?? Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }

  saveImageFile(File image) async {
    File file;

    try {
      Directory folder = await checkFolder();

      if (folder == null) {
        return;
      }

      file = await File(folder.path + "/" + image.path.split("/").last)
          .writeAsBytes(image.readAsBytesSync());
    } catch (e) {}

    if (file != null) {
      EasyLoading.showSuccess("تم الحفظ بنجاح");
      showImageDialog(file);
    } else {
      EasyLoading.showError("حدث خطأ ما!");
    }

    return file;
  }

  fontCustom(context) {
    showDialog(
      context: context,
      builder: (context) => FontCustomPage(
        parent: this,
      ),
    );
  }

  saveToDatabase(DatabaseProvider value) async {
    if (value.ids == null) {
      EasyLoading.showError("حدث خطأ ما!");
    } else {
      if (value.ids.contains(widget.quote.id)) {
        value.removeQuoteFromSaved(context, widget.quote);
      } else {
        value.addQuoteToSaved(context, widget.quote);
      }
    }
  }

  checkFolder() async {
    var storagePermission = await Permission.storage.request();

    if (storagePermission.isDenied) {
      EasyLoading.showError("لا يمكن حفظ الصورة بدون منح الاذونات");
      return null;
    }

    String path = await ExtStorage.getExternalStorageDirectory();
    Directory folder = Directory(path + "/حالات ورسايل");

    if (!folder.existsSync()) {
      await folder.create(recursive: true);
    }

    return folder;
  }

  Widget saveIcon() {
    if (widget.isSaved) {
      return IconButton(
          icon: Icon(FontAwesome.trash_o),
          onPressed: () {
            if (widget.databaseProvider != null) {
              widget.databaseProvider
                  .removeQuoteFromSaved(context, widget.quote);
            } else {
              EasyLoading.showError("خدث خطأ ما!");
            }
          });
    }

    return Consumer<DatabaseProvider>(
      builder: (context, value, child) {
        IconData icon = FontAwesome.heart_o;
        if (value.ids == null) {
          icon = FontAwesome.heart_o;
        } else if (value.ids.contains(widget.quote.id)) {
          icon = FontAwesome.heart;
        }

        return IconButton(
            icon: Icon(icon),
            onPressed: () {
              saveToDatabase(value);
            });
      },
    );
  }

  void showImageDialog(File file) {
    Alert(
        context: context,
        title: "معاينة الصورة",
        content: Image.file(file),
        buttons: [
          DialogButton(
              child: Icon(
                Icons.share_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                SocialShare.shareOptions(
                    "https://play.google.com/store/apps/details?id=com.alalfy.quotes_app",
                    imagePath: file.path);
              })
        ]).show();
  }
}
