// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:dyslexiaa/news/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/everything?q=dyslexia&apiKey=ff16d7c9204842b5a5943e7e0a8e2039';
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'].toString(),
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
