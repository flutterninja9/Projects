import '../../../../core/failures/failure.dart';
import '../entity/country.dart';
import 'package:dartz/dartz.dart';

abstract class GetCovidStatsCountriesRepository {
  Future<Either<Failure, List<Country>>> getStats();
}
