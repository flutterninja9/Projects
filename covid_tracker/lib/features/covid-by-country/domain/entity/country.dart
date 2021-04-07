import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Country extends Equatable {
  final String country;
  final String countryCode;
  final String slug;
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final String date;
  final String flag;

  const Country({
    @required this.country,
    @required this.countryCode,
    @required this.slug,
    @required this.newConfirmed,
    @required this.flag,
    @required this.totalConfirmed,
    @required this.newDeaths,
    @required this.totalDeaths,
    @required this.newRecovered,
    @required this.totalRecovered,
    @required this.date,
  });

  @override
  List<Object> get props {
    return [
      country,
      countryCode,
      slug,
      newConfirmed,
      totalConfirmed,
      newDeaths,
      totalDeaths,
      newRecovered,
      totalRecovered,
      date,
      flag,
    ];
  }
}
