import 'package:flutter/material.dart';

class CovidStatusAllCountry extends StatefulWidget {
  @override
  _CovidStatusAllCountryState createState() => _CovidStatusAllCountryState();
}

class _CovidStatusAllCountryState extends State<CovidStatusAllCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        'Country Stats',
        style: Theme.of(context).textTheme.headline1,
      ),
    ));
  }
}
