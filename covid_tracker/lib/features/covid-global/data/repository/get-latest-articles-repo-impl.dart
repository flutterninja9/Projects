import '../../../../core/failures/exceptions.dart';
import '../../../../core/failures/messages.dart';
import '../../../../core/platform/network-info.dart';
import '../source/get-latest-articles-remote-data-source.dart';
import '../../domain/entity/article.dart';
import '../../../../core/failures/failure.dart';
import '../../domain/repository/get-latest-articles-repository.dart';
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
