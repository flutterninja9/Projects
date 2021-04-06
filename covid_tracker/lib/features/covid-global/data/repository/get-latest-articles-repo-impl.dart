import 'package:covid_tracker/core/failures/exceptions.dart';
import 'package:covid_tracker/core/failures/messages.dart';
import 'package:covid_tracker/core/platform/network-info.dart';
import 'package:covid_tracker/features/covid-global/data/source/get-latest-articles-remote-data-source.dart';
import 'package:covid_tracker/features/covid-global/domain/entity/article.dart';
import 'package:covid_tracker/core/failures/failure.dart';
import 'package:covid_tracker/features/covid-global/domain/repository/get-latest-articles-repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class GetLatestArticlesRepositoryImpl
    implements GetLatestNewsArticlesRepository {
  final GetLatestArticlesRemoteDataSource source;
  final NetworkInfo networkInfo;

  GetLatestArticlesRepositoryImpl({
    @required this.source,
    @required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<Article>>> getArticles() async {
    if (await networkInfo.isConnected()) {
      try {
        final articles = await source.getLatestArticles();
        return Right(articles);
      } on NetworkException {
        return Left(NetworkFailure(NETWORK_FAILURE));
      }
    } else {
      return Left(NetworkFailure(NETWORK_FAILURE));
    }
  }
}
