import '../../domain/entity/summary.dart';
import 'package:flutter/cupertino.dart';

class SummaryModel extends Summary {
  const SummaryModel({
    @required String lastUpdated,
    @required int confirmedCases,
    @required int recoveredCases,
    @required int deathCases,
  }) : super(
          deaths: deathCases,
          confirmed: confirmedCases,
          lastUpdated: lastUpdated,
          recovered: recoveredCases,
        );

  // Only Give Global Part here
  factory SummaryModel.fromJson({@required Map<String, dynamic> jsonMap}) {
    return SummaryModel(
      lastUpdated: jsonMap['Date'].toString(),
      confirmedCases: (jsonMap['TotalConfirmed'] as num).toInt(),
      recoveredCases: (jsonMap['TotalRecovered'] as num).toInt(),
      deathCases: (jsonMap['TotalDeaths'] as num).toInt(),
    );
  }

  // For caching purposes
  Map<String, dynamic> toJson() {
    return {
      'Date': lastUpdated,
      'TotalConfirmed': confirmed,
      'TotalRecovered': recovered,
      'TotalDeaths': deaths,
    };
  }
}
