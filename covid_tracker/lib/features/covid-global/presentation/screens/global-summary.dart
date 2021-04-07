import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/theme-controller.dart';
import '../../../../core/shared/loading-failed.dart';
import '../../../../core/shared/loading.dart';
import '../news-bloc/news_bloc_bloc.dart';
import '../summary-bloc/summary_bloc.dart';
import '../widgets/summary-screen.dart';

// ignore: use_key_in_widget_constructors
class GlobalSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Covid Tracker',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.wb_sunny,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              Get.find<ThemeController>().changeTheme();
            },
          ),
        ],
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
