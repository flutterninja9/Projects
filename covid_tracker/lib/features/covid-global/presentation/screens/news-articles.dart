import '../../../../core/shared/loading-failed.dart';
import '../../../../core/shared/loading.dart';
import '../news-bloc/news_bloc_bloc.dart';
import '../widgets/articles-section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsArticles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latest Articles',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: BlocBuilder<NewsBloc, NewsBlocState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            context.read<NewsBloc>().add(FetchArticlesTrigger());
            return Loading();
          } else if (state is NewsLoading) {
            return Loading();
          } else if (state is NewsBlocLoadFailed) {
            return LoadingFailed(
              cause: state.failure.message,
            );
          } else if (state is NewsLoaded) {
            return Articles(
              articles: state.articles,
            );
          }
          return Container();
        },
      ),
    );
  }
}
