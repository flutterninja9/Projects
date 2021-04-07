import 'package:covid_tracker/core/failures/failure.dart';
import 'package:covid_tracker/core/usecase/base-usecase.dart';
import 'package:covid_tracker/features/covid-by-country/domain/entity/country.dart';
import 'package:covid_tracker/features/covid-by-country/domain/repository/get-covid-stats-all-countries-repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class GetCovidStatsCountries implements Usecase<List<Country>, NoParams> {
  final GetCovidStatsCountriesRepository repository;

  GetCovidStatsCountries({
    @required this.repository,
  });
  @override
  Future<Either<Failure, List<Country>>> call({NoParams params}) async {
    return repository.getStats();
  }
}
