part of 'news_bloc_bloc.dart';

abstract class NewsBlocState extends Equatable {
  const NewsBlocState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsBlocState {}

class NewsLoading extends NewsBlocState {}

class NewsLoaded extends NewsBlocState {
  final List<Article> articles;
  const NewsLoaded({
    @required this.articles,
  });

  @override
  List<Object> get props => [articles];
}

class NewsBlocLoadFailed extends NewsBlocState {
  final Failure failure;

  const NewsBlocLoadFailed({
    @required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
