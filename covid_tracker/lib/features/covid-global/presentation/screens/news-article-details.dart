import 'package:covid_tracker/core/utils/get-date-time.dart';
import 'package:covid_tracker/core/utils/launchUrl.dart';
import 'package:flutter/material.dart';

import 'package:covid_tracker/features/covid-global/domain/entity/article.dart';

class NewsArticleDetail extends StatelessWidget {
  final Article article;
  const NewsArticleDetail({
    Key key,
    @required this.article,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              article.title,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: article.url,
                  child: Image.network(article.urlToImage),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, left: 8, right: 8),
                  child: Text(
                    article.title,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18, left: 8, right: 8),
                  child: Text(
                    "Originally Posted on ${getDateTime(article.publishedAt)}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 18, left: 8, right: 12),
                  child: Text(
                    article.content,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        launchURL(url: article.url);
                      },
                      child: Text(
                        "READ MORE",
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
