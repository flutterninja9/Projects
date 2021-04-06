import 'package:covid_tracker/core/failures/failure.dart';
import 'package:covid_tracker/features/covid-global/domain/entity/article.dart';
import 'package:dartz/dartz.dart';

abstract class GetLatestNewsArticlesRepository {
  Future<Either<Failure, List<Article>>> getArticles();
}
