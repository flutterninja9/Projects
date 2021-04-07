import '../failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call({@required Params params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
