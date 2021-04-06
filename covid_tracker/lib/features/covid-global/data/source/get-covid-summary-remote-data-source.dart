import 'dart:convert';

import 'package:covid_tracker/core/failures/exceptions.dart';
import 'package:covid_tracker/core/routes/api-routes/api-endpoints.dart';
import 'package:covid_tracker/core/utils/get-endpoints.dart';
import 'package:covid_tracker/features/covid-global/data/models/summary-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class GetCovidSummaryRemoteDataSource {
  Future<SummaryModel> getSummary();
}

class GetCovidSummaryRemoteDataSourceImpl
    implements GetCovidSummaryRemoteDataSource {
  final http.Client client;

  GetCovidSummaryRemoteDataSourceImpl({
    @required this.client,
  });
  @override
  Future<SummaryModel> getSummary() async {
    final Response summaryRaw = await client.get(Uri.parse(
      getEndpoint(
        endpoint: Endpoint.Summary,
      ),
    ));
    if (summaryRaw.statusCode == 200) {
      final jsonMap = jsonDecode(summaryRaw.body);
      return SummaryModel.fromJson(
        jsonMap: jsonMap['Global'] as Map<String, dynamic>,
      );
    } else {
      throw NetworkException();
    }
  }
}
