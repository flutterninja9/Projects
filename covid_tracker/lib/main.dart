import 'package:covid_tracker/core/theme/apptheme.dart';
import 'package:covid_tracker/di.dart' as di;
import 'package:covid_tracker/di.dart';
import 'package:covid_tracker/features/covid-global/presentation/news-bloc/news_bloc_bloc.dart';
import 'package:covid_tracker/features/covid-global/presentation/screens/global-summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/covid-global/presentation/summary-bloc/summary_bloc.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SummaryBloc>(create: (context) => sl()),
        BlocProvider<NewsBloc>(create: (context) => sl()),
      ],
      child: MaterialApp(
        title: 'Covid Tracker',
        theme: AppTheme.primaryTheme,
        darkTheme: AppTheme.primaryDark,
        themeMode: ThemeMode.dark,
        home: GlobalSummaryScreen(),
      ),
    );
  }
}
