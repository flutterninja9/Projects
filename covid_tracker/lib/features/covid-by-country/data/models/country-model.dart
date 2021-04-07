import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:covid_tracker/features/covid-by-country/domain/entity/country.dart';

class CountryModel extends Country {
  const CountryModel({
    @required String country,
    @required String countryCode,
    @required String slug,
    @required int newConfirmed,
    @required int totalConfirmed,
    @required int newDeaths,
    @required int totalDeaths,
    @required int newRecovered,
    @required int totalRecovered,
    @required String date,
    @required String flag,
  }) : super(
          newConfirmed: newConfirmed,
          newDeaths: newDeaths,
          date: date,
          newRecovered: newRecovered,
          slug: slug,
          totalDeaths: totalDeaths,
          flag: flag,
          country: country,
          totalConfirmed: totalConfirmed,
          totalRecovered: totalRecovered,
          countryCode: countryCode,
        );

  CountryModel copyWith({
    String country,
    String countryCode,
    String slug,
    int newConfirmed,
    int totalConfirmed,
    int newDeaths,
    int totalDeaths,
    int newRecovered,
    int totalRecovered,
    String date,
    String flag,
  }) {
    return CountryModel(
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      slug: slug ?? this.slug,
      newConfirmed: newConfirmed ?? this.newConfirmed,
      totalConfirmed: totalConfirmed ?? this.totalConfirmed,
      newDeaths: newDeaths ?? this.newDeaths,
      totalDeaths: totalDeaths ?? this.totalDeaths,
      newRecovered: newRecovered ?? this.newRecovered,
      totalRecovered: totalRecovered ?? this.totalRecovered,
      date: date ?? this.date,
      flag: flag ?? this.flag,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'countryCode': countryCode,
      'slug': slug,
      'newConfirmed': newConfirmed,
      'totalConfirmed': totalConfirmed,
      'newDeaths': newDeaths,
      'totalDeaths': totalDeaths,
      'newRecovered': newRecovered,
      'totalRecovered': totalRecovered,
      'date': date,
      'flag': flag,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      country: map['Country'] as String,
      countryCode: map['CountryCode'] as String,
      slug: map['Slug'] as String,
      newConfirmed: map['NewConfirmed'] as int,
      totalConfirmed: map['TotalConfirmed'] as int,
      newDeaths: map['NewDeaths'] as int,
      totalDeaths: map['TotalDeaths'] as int,
      newRecovered: map['NewRecovered'] as int,
      totalRecovered: map['TotalRecovered'] as int,
      date: map['Date'] as String,
      flag:
          'https://www.countryflags.io/${(map['CountryCode'] as String).toLowerCase()}/flat/32.png',
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryModel(country: $country, countryCode: $countryCode, slug: $slug, newConfirmed: $newConfirmed, totalConfirmed: $totalConfirmed, newDeaths: $newDeaths, totalDeaths: $totalDeaths, newRecovered: $newRecovered, totalRecovered: $totalRecovered, date: $date, flag: $flag)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CountryModel &&
        other.country == country &&
        other.countryCode == countryCode &&
        other.slug == slug &&
        other.newConfirmed == newConfirmed &&
        other.totalConfirmed == totalConfirmed &&
        other.newDeaths == newDeaths &&
        other.totalDeaths == totalDeaths &&
        other.newRecovered == newRecovered &&
        other.totalRecovered == totalRecovered &&
        other.date == date &&
        other.flag == flag;
  }

  @override
  int get hashCode {
    return country.hashCode ^
        countryCode.hashCode ^
        slug.hashCode ^
        newConfirmed.hashCode ^
        totalConfirmed.hashCode ^
        newDeaths.hashCode ^
        totalDeaths.hashCode ^
        newRecovered.hashCode ^
        totalRecovered.hashCode ^
        date.hashCode ^
        flag.hashCode;
  }
}
