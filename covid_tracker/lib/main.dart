import 'package:covid_tracker/di.dart' as di;
import 'package:covid_tracker/di.dart';
import 'package:covid_tracker/features/covid-global/presentation/bloc/summary_bloc.dart';
import 'package:covid_tracker/features/covid-global/presentation/screens/global-summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<SummaryBloc>(
        create: (context) => sl<SummaryBloc>(),
        child: GlobalSummaryScreen(),
      ),
    );
  }
}
