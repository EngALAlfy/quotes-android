import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:quotes_app/utils/Config.dart';
import 'package:quotes_app/widgets/QuoteWidget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FontCustomPage extends StatefulWidget {
  final QuoteWidgetState parent;

  const FontCustomPage({Key key, this.parent}) : super(key: key);

  @override
  _FontCustomPageState createState() => _FontCustomPageState();
}

class _FontCustomPageState extends State<FontCustomPage> {
  Color fontColor = Colors.black;
  Color bgColor = Colors.white;
  String fontName = "hor";
  String fontDeco = "none";
  double fontSize = 20;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              onTap: bgColorDialog,
              title: Text("لون الخلفية"),
              trailing: CircleAvatar(
                backgroundColor: bgColor,
                radius: 15,
              ),
            ),
            Divider(),
            ListTile(
              onTap: fontColorDialog,
              title: Text("لون الخط"),
              trailing: CircleAvatar(
                backgroundColor: fontColor,
                radius: 15,
              ),
            ),
            Divider(),
            ListTile(
              onTap: fontNameDialog,
              title: Text("نوع الخط"),
              trailing: Text(fontName),
            ),
            Divider(),
            ListTile(
              onTap: fontDecoDialog,
              title: Text("زخرفه الخط"),
              trailing: Text(fontDeco),
            ),
            Divider(),
            ListTile(
              onTap: fontSizeDialog,
              title: Text("حجم الخط"),
              trailing: Text("$fontSize"),
            ),
            Row(
              children: [
                Expanded(
                  child: DialogButton(
                      child: Text(
                        "تم",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        widget.parent.setState(() {
                          widget.parent.widget.quote.fontSize = fontSize;
                          widget.parent.widget.quote.fontName = fontName;
                          widget.parent.widget.quote.fontDeco = fontDeco;
                          widget.parent.widget.quote.fontColor = fontColor;
                          widget.parent.widget.quote.bgColor = bgColor;
                        });
                        Navigator.pop(context);
                      }),
                ),
                Expanded(
                  child: DialogButton(
                      color: Colors.red,
                      child: Text(
                        "الغاء",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  fontNameDialog() {
    showDialog(
      context: context,
      builder: (context) => FontNamePage(
        parent: this,
      ),
    );
  }

  fontDecoDialog() {
    showDialog(
      context: context,
      builder: (context) => FontDecoPage(
        parent: this,
      ),
    );
  }

  fontSizeDialog() {
    showDialog(
      context: context,
      builder: (context) => FontSizePage(
        parent: this,
      ),
    );
  }

  fontColorDialog() {
    MaterialColor white = MaterialColor(
      Colors.white.value,
      <int, Color>{
        500: Colors.white,
      },
    );

    MaterialColor black = MaterialColor(
      Colors.black.value,
      <int, Color>{
        500: Colors.black,
      },
    );



    List<ColorSwatch> colors = [];
    colors.addAll(Colors.primaries);
    colors.add(white);
    colors.add(Colors.grey);
    colors.add(black);


    Alert(
      context: context,
      content: Container(
        child: Container(
          child: MaterialColorPicker(
            onColorChange: (Color color) {
              fontColor = color;
            },
            onlyShadeSelection: true,
            circleSize: 50,
            onMainColorChange: (value) {
              fontColor = value;
            },
            selectedColor: fontColor,
            colors: colors,
          ),
          height: 250,
        ),
        width: double.infinity,
      ),
      title: "اختر لون",
      buttons: [
        DialogButton(
            child: Text(
              "تم",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            }),
        DialogButton(
            color: Colors.red,
            child: Text(
              "الغاء",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    ).show();
  }

  bgColorDialog() {
    MaterialColor white = MaterialColor(
      Colors.white.value,
      <int, Color>{
        500: Colors.white,
      },
    );

    MaterialColor black = MaterialColor(
      Colors.black.value,
      <int, Color>{
        500: Colors.black,
      },
    );



    List<ColorSwatch> colors = [];
    colors.addAll(Colors.primaries);
    colors.add(white);
    colors.add(Colors.grey);
    colors.add(black);
    Alert(
      context: context,
      content: Container(
        child: Container(
          child: MaterialColorPicker(
            onColorChange: (Color color) {
              bgColor = color;
            },
            onlyShadeSelection: true,
            circleSize: 50,
            colors: colors,
            onMainColorChange: (value) {
              bgColor = value;
            },
            selectedColor: bgColor,
          ),
          height: 250,
        ),
        width: double.infinity,
      ),
      title: "اختر لون",
      buttons: [
        DialogButton(
            child: Text(
              "تم",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            }),
        DialogButton(
            color: Colors.red,
            child: Text(
              "الغاء",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    ).show();
  }
}

class FontDecoPage extends StatefulWidget {
  final _FontCustomPageState parent;

  const FontDecoPage({Key key, this.parent}) : super(key: key);

  @override
  _FontDecoPageState createState() => _FontDecoPageState();
}

class _FontDecoPageState extends State<FontDecoPage> {
  String title = "زخرفه الخط";
  List<DropdownMenuItem<String>> dropItems = [
  ];

  @override
  void initState() {
    dropItems = [
      DropdownMenuItem<String>(
        value: "none",
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "1",
        child: Text(
          title.characters.map((e) {
            if (Config.flip1.containsKey(e)) {
              return Config.flip1[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "2",
        child: Text(
          title.characters.map((e) {
            if (Config.flip2.containsKey(e)) {
              return Config.flip2[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "3",
        child: Text(
          title.characters.map((e) {
            if (Config.flip3.containsKey(e)) {
              return Config.flip3[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "4",
        child: Text(
          title.characters.map((e) {
            if (Config.flip4.containsKey(e)) {
              return Config.flip4[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "5",
        child: Text(
          title.characters.map((e) {
            if (Config.flip5.containsKey(e)) {
              return Config.flip5[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "6",
        child: Text(
          title.characters.map((e) {
            if (Config.flip6.containsKey(e)) {
              return Config.flip6[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "7",
        child: Text(
          title.characters.map((e) {
            if (Config.flip7.containsKey(e)) {
              return Config.flip7[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "8",
        child: Text(
          title.characters.map((e) {
            if (Config.flip8.containsKey(e)) {
              return Config.flip8[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "9",
        child: Text(
          title.characters.map((e) {
            if (Config.flip9.containsKey(e)) {
              return Config.flip9[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "10",
        child: Text(
          title.characters.map((e) {
            if (Config.flip10.containsKey(e)) {
              return Config.flip10[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "11",
        child: Text(
          title.characters.map((e) {
            if (Config.flip11.containsKey(e)) {
              return Config.flip11[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "12",
        child: Text(
          title.characters.map((e) {
            if (Config.flip12.containsKey(e)) {
              return Config.flip12[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      DropdownMenuItem<String>(
        value: "13",
        child: Text(
          title.characters.map((e) {
            if (Config.flip13.containsKey(e)) {
              return Config.flip13[e];
            }
            return e;
          }).join(),
          style: TextStyle(fontSize: 20),
        ),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              getTitle(),
              style:
                  TextStyle(fontSize: 25, fontFamily: widget.parent.fontName),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton(
              items: dropItems,
              isExpanded: true,
              value: widget.parent.fontDeco,
              onChanged: (value) {
                setState(() {
                  widget.parent.setState(() {
                    widget.parent.fontDeco = value;
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  String getTitle() {
    var text = title;
    switch (widget.parent.fontDeco) {
      case "1":
        text = title.characters.map((e) {
          if (Config.flip1.containsKey(e)) {
            return Config.flip1[e];
          }
          return e;
        }).join();
        break;
      case "2":
        text = title.characters.map((e) {
          if (Config.flip2.containsKey(e)) {
            return Config.flip2[e];
          }
          return e;
        }).join();
        break;
      case "3":
        text = title.characters.map((e) {
          if (Config.flip3.containsKey(e)) {
            return Config.flip3[e];
          }
          return e;
        }).join();
        break;
      case "4":
        text = title.characters.map((e) {
          if (Config.flip4.containsKey(e)) {
            return Config.flip4[e];
          }
          return e;
        }).join();
        break;
      case "5":
        text = title.characters.map((e) {
          if (Config.flip5.containsKey(e)) {
            return Config.flip5[e];
          }
          return e;
        }).join();
        break;
      case "6":
        text = title.characters.map((e) {
          if (Config.flip6.containsKey(e)) {
            return Config.flip6[e];
          }
          return e;
        }).join();
        break;
      case "7":
        text = title.characters.map((e) {
          if (Config.flip7.containsKey(e)) {
            return Config.flip7[e];
          }
          return e;
        }).join();
        break;
      case "8":
        text = title.characters.map((e) {
          if (Config.flip8.containsKey(e)) {
            return Config.flip8[e];
          }
          return e;
        }).join();
        break;
      case "9":
        text = title.characters.map((e) {
          if (Config.flip9.containsKey(e)) {
            return Config.flip9[e];
          }
          return e;
        }).join();
        break;
      case "10":
        text = title.characters.map((e) {
          if (Config.flip10.containsKey(e)) {
            return Config.flip10[e];
          }
          return e;
        }).join();
        break;
      case "11":
        text = title.characters.map((e) {
          if (Config.flip11.containsKey(e)) {
            return Config.flip11[e];
          }
          return e;
        }).join();
        break;
      case "12":
        text = title.characters.map((e) {
          if (Config.flip12.containsKey(e)) {
            return Config.flip12[e];
          }
          return e;
        }).join();
        break;
      case "13":
        text = title.characters.map((e) {
          if (Config.flip13.containsKey(e)) {
            return Config.flip13[e];
          }
          return e;
        }).join();
        break;
      case "none":
      default:
        text = title;
    }
    return text;
  }
}

class FontNamePage extends StatefulWidget {
  final _FontCustomPageState parent;

  const FontNamePage({Key key, this.parent}) : super(key: key);

  @override
  _FontNamePageState createState() => _FontNamePageState();
}

class _FontNamePageState extends State<FontNamePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "نوع الخط",
              style:
                  TextStyle(fontSize: 25, fontFamily: widget.parent.fontName),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton(
              items: Config.FONTS.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    Config.FONTS[value],
                    style: TextStyle(fontFamily: value, fontSize: 20),
                  ),
                );
              }).toList(),
              isExpanded: true,
              value: widget.parent.fontName,
              onChanged: (value) {
                setState(() {
                  widget.parent.setState(() {
                    widget.parent.fontName = value;
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FontSizePage extends StatefulWidget {
  final _FontCustomPageState parent;

  const FontSizePage({Key key, this.parent}) : super(key: key);

  @override
  _FontSizePageState createState() => _FontSizePageState();
}

class _FontSizePageState extends State<FontSizePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "حجم الخط",
              style: TextStyle(fontSize: widget.parent.fontSize),
            ),
            Slider(
              max: 50,
              min: 15,
              value: widget.parent.fontSize,
              onChanged: (value) {
                setState(() {
                  widget.parent.setState(() {
                    widget.parent.fontSize = value.roundToDouble();
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
