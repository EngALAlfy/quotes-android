import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quotes_app/models/Category.dart';

part 'Quote.g.dart';

@JsonSerializable(explicitToJson: true)
class Quote {
  String id;

  String text;
  Category category;

  List<String> tags;

  String createdAt;
  String updatedAt;

  @JsonKey(ignore: true)
  Color bgColor;

  @JsonKey(ignore: true)
  Color fontColor = Colors.black;

  @JsonKey(ignore: true)
  String fontName = "hor";

  @JsonKey(ignore: true)
  String fontDeco = "none";

  @JsonKey(ignore: true)
  double fontSize = 35;

  @JsonKey(ignore: true)
  bool isAd = false;

  Quote({this.id, this.text , this.category ,this.tags , this.createdAt, this.updatedAt , this.isAd = false});

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}