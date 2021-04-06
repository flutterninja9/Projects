import 'package:covid_tracker/core/failures/failure.dart';
import 'package:covid_tracker/core/usecase/base-usecase.dart';
import 'package:covid_tracker/features/covid-global/domain/entity/article.dart';
import 'package:covid_tracker/features/covid-global/domain/repository/get-latest-articles-repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class GetLatestArticles implements Usecase<List<Article>, NoParams> {
  final GetLatestNewsArticlesRepository repository;

  GetLatestArticles({
    @required this.repository,
  });
  @override
  Future<Either<Failure, List<Article>>> call({NoParams params}) async {
    return repository.getArticles();
  }
}
