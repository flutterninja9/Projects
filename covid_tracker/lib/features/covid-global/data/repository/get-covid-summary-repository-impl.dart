import 'package:covid_tracker/core/failures/exceptions.dart';
import 'package:covid_tracker/core/failures/messages.dart';
import 'package:covid_tracker/core/platform/network-info.dart';
import 'package:covid_tracker/features/covid-global/data/source/get-covid-summary-local-data-source.dart';
import 'package:covid_tracker/features/covid-global/data/source/get-covid-summary-remote-data-source.dart';
import 'package:covid_tracker/features/covid-global/domain/entity/summary.dart';
import 'package:covid_tracker/core/failures/failure.dart';
import 'package:covid_tracker/features/covid-global/domain/repository/get-covid-summary-repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class GetCovidSummaryRepositoryImpl implements GetCovidSummaryRepository {
  final NetworkInfo networkInfo;
  final GetCovidSummaryRemoteDataSource remoteDataSource;
  final GetCovidSummaryLocalDataSource localDataSource;

  GetCovidSummaryRepositoryImpl({
    @required this.networkInfo,
    @required this.remoteDataSource,
    @required this.localDataSource,
  });
  @override
  Future<Either<Failure, Summary>> getSummary() async {
    if (await networkInfo.isConnected()) {
      try {
        final summary = await remoteDataSource.getSummary();
        localDataSource.cacheSummary(summary: summary);
        return Right(summary);
      } on NetworkException {
        return Left(NetworkFailure(NETWORK_FAILURE));
      }
    } else {
      try {
        final summaryCached = await localDataSource.retrieveCachedSummary();
        return Right(summaryCached);
      } on CacheException {
        return Left(CacheFailure(CACHE_FAILURE));
      }
    }
  }
}
