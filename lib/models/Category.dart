import 'package:json_annotation/json_annotation.dart';
import 'package:quotes_app/models/Quote.dart';

part 'Category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  String id;
  String name;
  String createdAt;
  String updatedAt;
  int quotes_count;

  List<Quote> quotes;

  @JsonKey(ignore: true)
  bool isAd = false;

  Category({this.id, this.name, this.createdAt, this.updatedAt, this.quotes_count , this.quotes , this.isAd = false});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}