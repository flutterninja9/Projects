import 'package:covid_tracker/features/covid-global/domain/entity/article.dart';
import 'package:covid_tracker/features/covid-global/presentation/news-bloc/news_bloc_bloc.dart';
import 'package:covid_tracker/features/covid-global/presentation/widgets/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Articles extends StatelessWidget {
  final List<Article> articles;
  const Articles({Key key, @required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewsBloc>(context).add(FetchArticlesTrigger());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => SingleArticle(
                  article: articles[index],
                ),
                childCount: articles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
