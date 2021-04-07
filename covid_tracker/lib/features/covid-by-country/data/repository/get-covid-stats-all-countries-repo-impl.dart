import '../../../../core/failures/exceptions.dart';
import '../../../../core/failures/messages.dart';
import '../../../../core/platform/network-info.dart';
import '../sources/get-covid-countries.stats-remote-data-source.dart';
import '../../domain/entity/country.dart';
import '../../../../core/failures/failure.dart';
import '../../domain/repository/get-covid-stats-all-countries-repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class GetCovidStatsCountriesRepositoryImpl
    implements GetCovidStatsCountriesRepository {
  final GetCovidStatsConutriesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetCovidStatsCountriesRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<Country>>> getStats() async {
    if (await networkInfo.isConnected()) {
      try {
        final countrySummaries = await remoteDataSource.getStats();
        return Right(countrySummaries);
      } on NetworkException {
        return Left(NetworkFailure(NETWORK_FAILURE));
      }
    } else {
      return Left(NetworkFailure(NETWORK_FAILURE));
    }
  }
}
