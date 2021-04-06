import 'package:covid_tracker/features/covid-global/data/source/get-latest-articles-remote-data-source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  GetLatestArticlesRemoteDataSourceImpl remoteDataSourceImpl;
  http.Client client;

  setUp(() {
    client = http.Client();
    remoteDataSourceImpl =
        GetLatestArticlesRemoteDataSourceImpl(client: client);
  });

  test('should fetch news articles from remote-data-source', () async {
    //arrange
    final result = await remoteDataSourceImpl.getLatestArticles();
    //assert
    print(result[0].content);
  });
}
