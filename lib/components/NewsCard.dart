import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/NewsModel.dart';
import '../pages/NewsDetailPage.dart';
import '../providers/NewsProvider.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;

  NewsCard({@required this.news});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            provider.updateSelectedNews(news);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NewsDetailPage(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.network(
                    news.adt,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    news.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    news.createdAt,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
