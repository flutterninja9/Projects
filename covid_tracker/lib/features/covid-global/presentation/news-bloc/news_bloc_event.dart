part of 'news_bloc_bloc.dart';

abstract class NewsBlocEvent extends Equatable {
  const NewsBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchArticlesTrigger extends NewsBlocEvent {}
