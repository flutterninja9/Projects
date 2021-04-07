import '../../../../core/failures/exceptions.dart';
import '../../../../core/failures/messages.dart';
import '../../../../core/platform/network-info.dart';
import '../source/get-covid-summary-local-data-source.dart';
import '../source/get-covid-summary-remote-data-source.dart';
import '../../domain/entity/summary.dart';
import '../../../../core/failures/failure.dart';
import '../../domain/repository/get-covid-summary-repository.dart';
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
