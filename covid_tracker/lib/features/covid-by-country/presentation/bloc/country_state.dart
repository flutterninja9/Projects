part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryInitial extends CountryState {}

class CountryDataLoading extends CountryState {}

class CountryDataLoaded extends CountryState {
  final List<Country> countries;

  const CountryDataLoaded({@required this.countries});

  @override
  List<Object> get props => [countries];
}

class CountryLoadingFailed extends CountryState {
  final Failure failure;

  const CountryLoadingFailed({@required this.failure});

  @override
  List<Object> get props => [failure];
}
