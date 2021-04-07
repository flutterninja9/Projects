import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../core/failures/failure.dart';
import '../../../../core/shared/loading.dart';
import '../../../../core/usecase/base-usecase.dart';
import '../../domain/entity/article.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecase/get-latest-articles.dart';
import 'package:flutter/cupertino.dart';

part 'news_bloc_event.dart';
part 'news_bloc_state.dart';

class NewsBloc extends Bloc<NewsBlocEvent, NewsBlocState> {
  NewsBloc({
    @required this.getLatestArticles,
  }) : super(NewsInitial());
  final GetLatestArticles getLatestArticles;
  @override
  Stream<NewsBlocState> mapEventToState(
    NewsBlocEvent event,
  ) async* {
    if (event is FetchArticlesTrigger) {
      yield NewsLoading();
      final articlesOrFailure = await getLatestArticles();
      yield* articlesOrFailure.fold(
        (failure) async* {
          yield NewsBlocLoadFailed(failure: failure);
        },
        (articles) async* {
          yield NewsLoaded(articles: articles);
        },
      );
    }
  }
}
