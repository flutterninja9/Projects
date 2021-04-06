import 'package:flutter/cupertino.dart';

abstract class Failure {
  final String message;

  Failure({
    @required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'Failure(message: $message)';
}

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure(this.message) : super(message: message);
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure(this.message) : super(message: message);
}
