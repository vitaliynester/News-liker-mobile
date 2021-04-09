import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/NewsDetailModel.dart';
import '../models/NewsModel.dart';
import '../providers/DatabaseProvider.dart';

class NewsProvider extends ChangeNotifier {
  bool favoriteNews = false;
  NewsModel newsModel;
  DatabaseProvider db;

  NewsProvider() {
    db = new DatabaseProvider();
    db.open();
  }

  Future<List<NewsModel>> getAllNews() async {
    List<NewsModel> newsList = new List<NewsModel>();
    String url =
        "https://xn--80aacoonefzg3am8b1fsb.xn--p1ai/api/news/page?skip=0&take=50";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes))['value'];
      for (var item in body) {
        newsList.add(NewsModel.fromJson(item));
      }
    }
    return newsList;
  }

  Future<List<NewsModel>> getAllFavoriteNews() async {
    List<NewsModel> newsList = await db.getAllNews();
    return newsList;
  }

  Future<NewsDetailModel> getDetailModel() async {
    int neededId = newsModel.id;
    String url =
        "https://xn--80aacoonefzg3am8b1fsb.xn--p1ai/api/news/$neededId";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      NewsDetailModel news = NewsDetailModel.fromJson(body);
      favoriteNews = await checkIfFavorite();
      notifyListeners();
      return news;
    }
    return null;
  }

  Future<bool> checkIfFavorite() async {
    var dbNewsId = await db.getNews(newsModel.id);
    if (dbNewsId != null) {
      return true;
    }
    return false;
  }

  Future likeButton() async {
    var news = await db.getNews(newsModel.id);
    if (news != null) {
      toogleFavorite();
      await db.delete(newsModel.id);
      return;
    }
    toogleFavorite();
    await db.insert(newsModel);
  }

  void toogleFavorite() {
    favoriteNews = !favoriteNews;
    notifyListeners();
  }

  void addToFavorite() async {
    var inserted = await db.insert(newsModel);
    if (inserted != null) {
      notifyListeners();
    }
  }

  void updateSelectedNews(NewsModel news) {
    newsModel = news;
    favoriteNews = false;
    notifyListeners();
  }
}
