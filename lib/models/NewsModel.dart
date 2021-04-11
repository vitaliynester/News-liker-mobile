import 'package:flutter/material.dart';

class NewsModel {
  int id;
  String title;
  String createdAt;
  String adt;

  NewsModel({
    @required this.id,
    @required this.title,
    @required this.createdAt,
    @required this.adt,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    adt = json['adt'];
  }

  Map<String, dynamic> toJson() {
    var json = new Map<String, dynamic>();
    json['id'] = id;
    json['title'] = title;
    json['created_at'] = createdAt;
    json['adt'] = adt;
    return json;
  }
}
