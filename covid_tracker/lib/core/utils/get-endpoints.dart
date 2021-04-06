import 'package:covid_tracker/core/routes/api-routes/api-endpoints.dart';
import 'package:covid_tracker/core/utils/api-url-maker.dart';
import 'package:flutter/foundation.dart';

String getEndpoint({@required Endpoint endpoint}) {
  switch (endpoint) {
    case Endpoint.Summary:
      return endpoints[endpoint];
    default:
      return baseUrl;
  }
}
