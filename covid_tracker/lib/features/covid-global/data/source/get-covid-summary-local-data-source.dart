import '../models/summary-model.dart';
import 'package:flutter/cupertino.dart';

abstract class GetCovidSummaryLocalDataSource {
  Future<void> cacheSummary({@required SummaryModel summary});
  Future<SummaryModel> retrieveCachedSummary();
}

class GetCovidSummaryLocalDataSourceImpl
    implements GetCovidSummaryLocalDataSource {
  @override
  Future<void> cacheSummary({SummaryModel summary}) {
    print('Caching to be done later');
    return Future.value();
  }

  @override
  Future<SummaryModel> retrieveCachedSummary() {
    print('Caching logic to be implemented later.');
    return Future.value(
      const SummaryModel(
        lastUpdated: '',
        confirmedCases: 00,
        recoveredCases: 00,
        deathCases: 00,
      ),
    );
  }
}
