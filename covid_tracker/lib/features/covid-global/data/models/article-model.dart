import 'package:covid_tracker/features/covid-global/domain/entity/article.dart';
import 'package:flutter/foundation.dart';

class ArticleModel extends Article {
  const ArticleModel({
    @required Map source,
    @required String author,
    @required String title,
    @required String description,
    @required String url,
    @required String urlToImage,
    @required String publishedAt,
    @required String content,
  }) : super(
          url: url,
          urlToImage: urlToImage,
          source: source,
          content: content,
          publishedAt: publishedAt,
          title: title,
          description: description,
          author: author,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: json['source'] as Map,
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
}
