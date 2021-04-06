import 'package:covid_tracker/core/failures/failure.dart';
import 'package:covid_tracker/features/covid-global/domain/entity/summary.dart';
import 'package:dartz/dartz.dart';

abstract class GetCovidSummaryRepository {
  Future<Either<Failure, Summary>> getSummary();
}
