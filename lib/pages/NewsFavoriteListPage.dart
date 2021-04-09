import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/NewsCard.dart';
import '../models/NewsModel.dart';
import '../providers/NewsProvider.dart';

class NewsFavoriteListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<List<NewsModel>>(
          future: provider.getAllFavoriteNews(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? snapshot.data.isNotEmpty
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, idx) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewsCard(news: snapshot.data[idx]),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          "Избранных записей нет!",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                : Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  );
          },
        );
      },
    );
  }
}
