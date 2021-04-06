import 'package:covid_tracker/core/utils/get-date-time.dart';
import 'package:covid_tracker/features/covid-global/domain/entity/summary.dart';
import 'package:covid_tracker/features/covid-global/presentation/widgets/status-card.dart';
import 'package:flutter/material.dart';

class SummaryLoadedScreen extends StatelessWidget {
  final Summary summary;
  const SummaryLoadedScreen({
    Key key,
    @required this.summary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Last updated ${getDateTime(summary.lastUpdated)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        StatusCard(
          color: Colors.blue,
          lable: 'Total Confirmed',
          value: summary.confirmed.toString(),
        ),
        StatusCard(
          color: Colors.green,
          lable: 'Total Recovered',
          value: summary.recovered.toString(),
        ),
        StatusCard(
          color: Colors.redAccent,
          lable: 'Total Deaths',
          value: summary.deaths.toString(),
        ),
      ],
    );
  }
}
