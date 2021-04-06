import 'package:covid_tracker/features/covid-global/data/source/get-covid-summary-remote-data-source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  GetCovidSummaryRemoteDataSourceImpl remoteDataSourceImpl;
  http.Client client;

  setUp(() {
    client = http.Client();
    remoteDataSourceImpl = GetCovidSummaryRemoteDataSourceImpl(client: client);
  });

  test('should fetch data from remote-data-source', () async {
    //arrange
    final result = await remoteDataSourceImpl.getSummary();
    //assert
    print(result.confirmed);
    print(result.deaths);
    print(result.lastUpdated);
    print(result.recovered);
  });
}
