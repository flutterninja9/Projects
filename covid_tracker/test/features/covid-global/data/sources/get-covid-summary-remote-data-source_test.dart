import 'package:covid_tracker/features/covid-global/data/source/get-covid-summary-remote-data-source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  GetCovidSummaryRemoteDataSourceImpl remoteDataSourceImpl;
  Dio dio;

  setUp(() {
    dio = Dio();
    remoteDataSourceImpl = GetCovidSummaryRemoteDataSourceImpl(dio: dio);
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
