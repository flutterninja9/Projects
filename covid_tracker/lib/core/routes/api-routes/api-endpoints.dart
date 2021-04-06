import 'package:covid_tracker/core/utils/api-url-maker.dart';

enum Endpoint {
  Summary,
}

final endpoints = {
  Endpoint.Summary: '/summary'.makeUrl(),
};
