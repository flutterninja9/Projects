import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/cupertino.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl({
    @required this.connectivity,
  });

  @override
  Future<bool> isConnected() async => connectivity.checkConnection();
}
