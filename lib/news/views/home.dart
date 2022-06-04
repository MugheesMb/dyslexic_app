// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../article_model.dart';
import '../news.dart';
import 'article_list.dart';

class NewsHome extends StatefulWidget {
  static const routeName = "news-home";
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  List<ArticleModel> articles = <ArticleModel>[];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Dyslexia '),
            Text(
              'News',
              style: TextStyle(
                color: Color.fromARGB(255, 245, 245, 245),
              ),
            ),
          ],
        ),
      ),
      body: _loading
          ? SingleChildScrollView(
              child: Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: <Widget>[
                    ArticleList(
                      articles: articles,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
