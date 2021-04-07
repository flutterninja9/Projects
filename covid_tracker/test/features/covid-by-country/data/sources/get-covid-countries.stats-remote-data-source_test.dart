import 'package:covid_tracker/features/covid-by-country/data/sources/get-covid-countries.stats-remote-data-source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  GetCovidStatsConutriesRemoteDataSourceImpl remoteDataSourceImpl;
  http.Client client;

  setUp(() {
    client = http.Client();
    remoteDataSourceImpl =
        GetCovidStatsConutriesRemoteDataSourceImpl(client: client);
  });

  test('should countries data from remote-data-source', () async {
    //arrange
    final result = await remoteDataSourceImpl.getStats();
    //assert
    print(result[0].country);
    print(result[0].countryCode);
    print(result[0].totalDeaths);
  });
}
