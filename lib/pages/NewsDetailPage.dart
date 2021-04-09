import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/NewsDetailModel.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:http/http.dart' as http;

class NewsDetailPage extends StatelessWidget {
  final int newsId;

  NewsDetailPage({@required this.newsId});

  Future<NewsDetailModel> getDetailNews() async {
    String url = "https://xn--80aacoonefzg3am8b1fsb.xn--p1ai/api/news/$newsId";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      NewsDetailModel news = NewsDetailModel.fromJson(body);
      return news;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<NewsDetailModel>(
        future: getDetailNews(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            snapshot.data.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.topLeft,
                          child: Text(
                            snapshot.data.createdAt,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Image.network(
                            snapshot.data.adt,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        SizedBox(height: 10),
                        CarouselSlider.builder(
                          options: CarouselOptions(),
                          itemCount: snapshot.data.images.length,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  snapshot.data.images[index],
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: HtmlWidget(
                            snapshot.data.content,
                            textStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
