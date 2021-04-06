import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Summary extends Equatable {
  final String lastUpdated;
  final int confirmed;
  final int recovered;
  final int deaths;

  const Summary({
    @required this.lastUpdated,
    @required this.confirmed,
    @required this.deaths,
    @required this.recovered,
  });
  @override
  List<Object> get props => [
        lastUpdated,
        confirmed,
        recovered,
        deaths,
      ];
}
