import 'package:covid_tracker/core/platform/network-info.dart';
import 'package:covid_tracker/features/covid-global/data/repository/get-covid-summary-repository-impl.dart';
import 'package:covid_tracker/features/covid-global/data/source/get-covid-summary-local-data-source.dart';
import 'package:covid_tracker/features/covid-global/data/source/get-covid-summary-remote-data-source.dart';
import 'package:covid_tracker/features/covid-global/domain/repository/get-covid-summary-repository.dart';
import 'package:covid_tracker/features/covid-global/domain/usecase/get-covid-summary.dart';
import 'package:covid_tracker/features/covid-global/presentation/bloc/summary_bloc.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //? Factories
  sl.registerFactory(() => SummaryBloc(getCovidSummary: sl()));

  //? Usecases
  sl.registerLazySingleton(() => GetCovidSummary(repository: sl()));

  //? Repositories
  sl.registerLazySingleton<GetCovidSummaryRepository>(
      () => GetCovidSummaryRepositoryImpl(
            networkInfo: sl(),
            remoteDataSource: sl(),
            localDataSource: sl(),
          ));

  //? Data Sources
  sl.registerLazySingleton<GetCovidSummaryLocalDataSource>(
    () => GetCovidSummaryLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<GetCovidSummaryRemoteDataSource>(
    () => GetCovidSummaryRemoteDataSourceImpl(client: sl()),
  );

  //? Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: sl()));

  //? external

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}
