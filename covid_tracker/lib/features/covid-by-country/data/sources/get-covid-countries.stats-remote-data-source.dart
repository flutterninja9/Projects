import 'dart:convert';

import '../../../../core/failures/exceptions.dart';
import '../../../../core/routes/api-routes/api-endpoints.dart';
import '../../../../core/utils/get-endpoints.dart';
import '../models/country-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class GetCovidStatsConutriesRemoteDataSource {
  Future<List<CountryModel>> getStats();
}

class GetCovidStatsConutriesRemoteDataSourceImpl
    implements GetCovidStatsConutriesRemoteDataSource {
  final http.Client client;

  GetCovidStatsConutriesRemoteDataSourceImpl({@required this.client});
  @override
  Future<List<CountryModel>> getStats() async {
    final response = await http.get(Uri.parse(
      getEndpoint(endpoint: Endpoint.Summary),
    ));
    if (response.statusCode == 200) {
      final List<CountryModel> countryStats = [];
      final rawData = jsonDecode(response.body) as Map<String, dynamic>;
      final rawCountries = rawData['Countries'] as List;
      // ignore: avoid_function_literals_in_foreach_calls
      rawCountries.forEach((rawCountry) {
        countryStats
            .add(CountryModel.fromMap(rawCountry as Map<String, dynamic>));
      });
      return countryStats;
    } else {
      print(response.body);
      throw NetworkException();
    }
  }
}
