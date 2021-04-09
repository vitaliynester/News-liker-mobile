import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:provider/provider.dart';

import '../models/NewsDetailModel.dart';
import '../providers/NewsProvider.dart';

class NewsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: provider.favoriteNews ? Colors.green : Colors.grey,
                ),
                onPressed: () async {
                  await provider.likeButton();
                },
              ),
            ],
          ),
          body: FutureBuilder<NewsDetailModel>(
            future: provider.getDetailModel(),
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
                            snapshot.data.images.isNotEmpty
                                ? SizedBox(height: 10)
                                : Container(),
                            snapshot.data.images.isNotEmpty
                                ? CarouselSlider.builder(
                                    options: CarouselOptions(),
                                    itemCount: snapshot.data.images.length,
                                    itemBuilder: (context, index, realIndex) {
                                      return Container(
                                        padding: EdgeInsets.all(5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            snapshot.data.images[index],
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Container(),
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
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    );
            },
          ),
        );
      },
    );
  }
}
