import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/base-usecase.dart';
import '../entity/summary.dart';
import '../repository/get-covid-summary-repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class GetCovidSummary implements Usecase<Summary, NoParams> {
  final GetCovidSummaryRepository repository;

  GetCovidSummary({
    @required this.repository,
  });

  @override
  Future<Either<Failure, Summary>> call({NoParams params}) async {
    return repository.getSummary();
  }
}
