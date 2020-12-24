import 'package:craftly/bloc/bloc/product_bloc.dart';
import 'package:craftly/screens/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(),
      child: GetMaterialApp(
        title: 'Craftly',
        theme: ThemeData(
            canvasColor: Colors.white,
            primarySwatch: Colors.pink,
            accentColor: Colors.pinkAccent),
        home: Root(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
