import '../../../../core/failures/failure.dart';
import '../entity/summary.dart';
import 'package:dartz/dartz.dart';

abstract class GetCovidSummaryRepository {
  Future<Either<Failure, Summary>> getSummary();
}
