import 'package:covid_tracker/core/utils/get-date-time.dart';
import 'package:covid_tracker/features/covid-global/domain/entity/summary.dart';
import 'package:covid_tracker/features/covid-global/presentation/bloc/summary_bloc.dart';
import 'package:covid_tracker/features/covid-global/presentation/widgets/status-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SummaryLoadedScreen extends StatelessWidget {
  final Summary summary;
  SummaryLoadedScreen({
    Key key,
    @required this.summary,
  }) : super(key: key);

  final NumberFormat numberFormat = NumberFormat.decimalPattern();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<SummaryBloc>(context).add(FetchSummaryTrigger());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Last updated  ${getDateTime(summary.lastUpdated)}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
              StatusCard(
                logo: 'all.svg',
                color: Colors.blue,
                lable: 'Total Confirmed',
                value: numberFormat.format(summary.confirmed),
              ),
              StatusCard(
                logo: 'recover.svg',
                color: Colors.green,
                lable: 'Total Recovered',
                value: numberFormat.format(summary.recovered),
              ),
              StatusCard(
                logo: 'dead.svg',
                color: Colors.redAccent,
                lable: 'Total Deaths',
                value: numberFormat.format(summary.deaths),
              ),
            ])),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, top: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'More info',
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
