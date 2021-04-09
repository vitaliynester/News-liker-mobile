import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/NewsModel.dart';
import 'package:flutter_application_1/pages/NewsDetailPage.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;

  NewsCard({@required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NewsDetailPage(
              newsId: news.id,
            ),
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
  }
}
