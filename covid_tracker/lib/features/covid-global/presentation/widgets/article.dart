import 'package:covid_tracker/core/utils/get-date-time.dart';
import 'package:covid_tracker/core/utils/launchUrl.dart';
import 'package:covid_tracker/features/covid-global/domain/entity/article.dart';
import 'package:flutter/material.dart';

class SingleArticle extends StatelessWidget {
  const SingleArticle({
    Key key,
    @required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchURL(url: article.url);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(article.urlToImage)),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3, right: 6, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          article.author,
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Text(
                          getDateTime(article.publishedAt),
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey[600],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3, right: 10, bottom: 8),
                  child: Text(
                    article.title,
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
