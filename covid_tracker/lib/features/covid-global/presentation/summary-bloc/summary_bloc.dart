import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/failures/failure.dart';
import '../../domain/entity/summary.dart';
import '../../domain/usecase/get-covid-summary.dart';

part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  SummaryBloc({
    @required this.getCovidSummary,
  }) : super(SummaryInitial());

  final GetCovidSummary getCovidSummary;

  @override
  Stream<SummaryState> mapEventToState(
    SummaryEvent event,
  ) async* {
    if (event is FetchSummaryTrigger) {
      yield SummaryLoading();
      final summaryOrFailure = await getCovidSummary();
      yield* summaryOrFailure.fold((failure) async* {
        yield SummaryLoadingFailed(cause: failure);
      }, (summary) async* {
        yield SummaryLoaded(summary: summary);
      });
    }
  }
}
