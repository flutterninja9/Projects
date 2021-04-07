import 'package:covid_tracker/core/utils/numberFormatter.dart';
import 'package:flutter/material.dart';

class TextStat extends StatelessWidget {
  const TextStat({
    Key key,
    @required this.color,
    @required this.stat,
  }) : super(key: key);

  final int stat;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      formatNumber(number: stat),
      style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: color,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}
