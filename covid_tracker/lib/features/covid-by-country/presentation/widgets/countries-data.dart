import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/country.dart';
import 'country-flag-section.dart';
import 'textStat.dart';

class CountriesData extends StatelessWidget {
  final List<Country> countries;
  const CountriesData({
    Key key,
    @required this.countries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FlagImage(
                    flag: countries[index].flag,
                    countryName: countries[index].country,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStat(
                          color: Colors.blue,
                          stat: countries[index].totalConfirmed),
                      TextStat(
                          color: Colors.green,
                          stat: countries[index].totalRecovered),
                      TextStat(
                          color: Colors.redAccent,
                          stat: countries[index].totalDeaths),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        childCount: countries.length,
      ),
    );
  }
}
