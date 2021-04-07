import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:covid_tracker/core/failures/failure.dart';
import 'package:covid_tracker/features/covid-by-country/domain/entity/country.dart';
import 'package:covid_tracker/features/covid-by-country/domain/usecase/get-covid-stats-coutries.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc({
    @required this.getCovidStatsCountries,
  }) : super(CountryInitial());

  final GetCovidStatsCountries getCovidStatsCountries;

  @override
  Stream<CountryState> mapEventToState(
    CountryEvent event,
  ) async* {
    if (event is FetchCountriesTrigger) {
      yield CountryDataLoading();
      print('started');
      final countriesDataOrFailure = await getCovidStatsCountries();
      yield* countriesDataOrFailure.fold(
        (failure) async* {
          yield CountryLoadingFailed(failure: failure);
        },
        (countriesData) async* {
          yield CountryDataLoaded(countries: countriesData);
        },
      );
    }
  }
}