import 'package:covid_tracker/core/failures/failure.dart';
import 'package:covid_tracker/features/covid-by-country/domain/entity/country.dart';
import 'package:dartz/dartz.dart';

abstract class GetCovidStatsCountriesRepository {
  Future<Either<Failure, List<Country>>> getStats();
}
