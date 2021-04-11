import 'dart:convert' as c;

import 'package:flutter/material.dart';

class NewsDetailModel {
  int id;
  String createdAt;
  String title;
  String content;
  String adt;
  List<String> images;

  NewsDetailModel({
    @required this.id,
    @required this.createdAt,
    @required this.title,
    @required this.content,
    @required this.adt,
    @required this.images,
  });

  NewsDetailModel.fromJson(Map<String, dynamic> json) {
    images = [];
    id = json['id'];
    createdAt = json['created_at'];
    title = json['title'];
    content = json['content'];
    adt = json['adt'];
    for (var image in json['files']) {
      images.add(image);
    }
  }

  Map<String, dynamic> toJson() {
    var json = new Map<String, dynamic>();
    json['id'] = id;
    json['created_at'] = createdAt;
    json['title'] = title;
    json['content'] = content;
    json['adt'] = adt;
    json['files'] = c.jsonEncode(images);
    return json;
  }
}
