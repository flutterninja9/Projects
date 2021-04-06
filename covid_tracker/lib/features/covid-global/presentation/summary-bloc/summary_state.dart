part of 'summary_bloc.dart';

abstract class SummaryState extends Equatable {
  const SummaryState();

  @override
  List<Object> get props => [];
}

class SummaryInitial extends SummaryState {}

class SummaryLoading extends SummaryState {}

class SummaryLoaded extends SummaryState {
  final Summary summary;

  const SummaryLoaded({@required this.summary});

  @override
  List<Object> get props => [summary];
}

class SummaryLoadingFailed extends SummaryState {
  final Failure cause;

  const SummaryLoadingFailed({@required this.cause});

  @override
  List<Object> get props => [cause];
}
