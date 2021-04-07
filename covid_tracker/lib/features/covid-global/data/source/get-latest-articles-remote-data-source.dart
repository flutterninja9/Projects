import 'dart:convert';

import 'package:covid_tracker/core/failures/exceptions.dart';
import 'package:covid_tracker/core/routes/api-routes/api-endpoints.dart';
import 'package:covid_tracker/core/utils/get-endpoints.dart';
import 'package:covid_tracker/features/covid-global/data/models/article-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class GetLatestArticlesRemoteDataSource {
  Future<List<ArticleModel>> getLatestArticles();
}

class GetLatestArticlesRemoteDataSourceImpl
    implements GetLatestArticlesRemoteDataSource {
  final http.Client client;

  GetLatestArticlesRemoteDataSourceImpl({
    @required this.client,
  });
  @override
  Future<List<ArticleModel>> getLatestArticles() async {
    final Response response = await http.get(Uri.parse(
      getEndpoint(
        endpoint: Endpoint.LatestArticles,
      ),
    ));
    if (response.statusCode == 200) {
      final List<ArticleModel> articles = [];
      final Map<String, dynamic> articlesRaw =
          jsonDecode(response.body) as Map<String, dynamic>;
      articlesRaw['articles'].toList().forEach((rawArticle) {
        articles.add(ArticleModel.fromJson(rawArticle as Map<String, dynamic>));
      });
      return articles;
    } else {
      print(response.body);
      throw NetworkException();
    }
  }
}
