import '../routes/api-routes/api-endpoints.dart';
import 'api-url-maker.dart';
import 'package:flutter/foundation.dart';

String getEndpoint({@required Endpoint endpoint}) {
  switch (endpoint) {
    case Endpoint.Summary:
      return endpoints[endpoint];
    case Endpoint.LatestArticles:
      return endpoints[endpoint];
    default:
      return baseUrl;
  }
}
