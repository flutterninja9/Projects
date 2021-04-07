import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/base-usecase.dart';
import '../entity/country.dart';
import '../repository/get-covid-stats-all-countries-repo.dart';
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
