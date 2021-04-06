import 'package:covid_tracker/core/shared/loading-failed.dart';
import 'package:covid_tracker/core/shared/loading.dart';
import 'package:covid_tracker/core/utils/get-date-time.dart';
import 'package:covid_tracker/features/covid-global/presentation/bloc/summary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalSummaryScreen extends StatelessWidget {
  GlobalSummaryScreen() : super(key: UniqueKey());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Stats'),
        centerTitle: true,
      ),
      body: BlocBuilder<SummaryBloc, SummaryState>(
        builder: (context, state) {
          if (state is SummaryInitial) {
            context.read<SummaryBloc>().add(FetchSummaryTrigger());
            return Loading();
          } else if (state is SummaryLoading) {
            return Loading();
          } else if (state is SummaryLoadingFailed) {
            return LoadingFailed(cause: state.cause.message);
          } else if (state is SummaryLoaded) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Last updated ${getDateTime(state.summary.lastUpdated)}'),
                  ],
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Text(
                          "Total Confirmed",
                        ),
                        Text(
                          state.summary.confirmed.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
