import '../../../../core/failures/failure.dart';
import '../entity/article.dart';
import 'package:dartz/dartz.dart';

abstract class GetLatestNewsArticlesRepository {
  Future<Either<Failure, List<Article>>> getArticles();
}
