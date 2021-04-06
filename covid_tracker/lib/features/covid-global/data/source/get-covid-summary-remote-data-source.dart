import 'package:covid_tracker/core/failures/exceptions.dart';
import 'package:covid_tracker/core/routes/api-routes/api-endpoints.dart';
import 'package:covid_tracker/core/utils/get-endpoints.dart';
import 'package:covid_tracker/features/covid-global/data/models/summary-model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class GetCovidSummaryRemoteDataSource {
  Future<SummaryModel> getSummary();
}

class GetCovidSummaryRemoteDataSourceImpl
    implements GetCovidSummaryRemoteDataSource {
  final Dio dio;

  GetCovidSummaryRemoteDataSourceImpl({
    @required this.dio,
  });
  @override
  Future<SummaryModel> getSummary() async {
    final Response<Map> summaryRaw = await dio.get(getEndpoint(
      endpoint: Endpoint.Summary,
    ));
    if (summaryRaw.statusCode == 200) {
      final Map<String, dynamic> jsonMap =
          summaryRaw.data['Global'] as Map<String, dynamic>;
      return SummaryModel.fromJson(
        jsonMap: jsonMap,
      );
    } else {
      throw NetworkException();
    }
  }
}
