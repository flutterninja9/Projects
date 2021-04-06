import 'package:covid_tracker/core/failures/failure.dart';
import 'package:covid_tracker/core/usecase/base-usecase.dart';
import 'package:covid_tracker/features/covid-global/domain/entity/summary.dart';
import 'package:covid_tracker/features/covid-global/domain/repository/get-covid-summary-repository.dart';
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
