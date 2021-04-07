import '../../shared/secrets.dart';
import '../../utils/api-url-maker.dart';

enum Endpoint {
  // ignore: constant_identifier_names
  Summary,
  // ignore: constant_identifier_names
  LatestArticles,
}

final endpoints = {
  Endpoint.Summary: '/summary'.makeUrl(),
  Endpoint.LatestArticles:
      'https://newsapi.org/v2/everything?q=covid&from=${dateTimeParserForUrl()}&sortBy=popularity&apiKey=$NEWS_API_KEY',
};

// Helps in fetching latest news articles
String dateTimeParserForUrl() {
  final dTime = DateTime.now();
  return "${dTime.year}-${dTime.month}-${dTime.day}";
}
