import 'package:covid_tracker/core/shared/loading-failed.dart';
import 'package:covid_tracker/core/shared/loading.dart';
import 'package:covid_tracker/features/covid-global/presentation/news-bloc/news_bloc_bloc.dart';
import 'package:covid_tracker/features/covid-global/presentation/summary-bloc/summary_bloc.dart';
import 'package:covid_tracker/features/covid-global/presentation/widgets/summary-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: use_key_in_widget_constructors
class GlobalSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Covid Tracker',
          style: Theme.of(context).textTheme.headline1,
        ),
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
            return BlocProvider.value(
              value: BlocProvider.of<NewsBloc>(context),
              child: SummaryLoadedScreen(
                summary: state.summary,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
