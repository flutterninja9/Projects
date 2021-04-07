import 'core/controllers/theme-controller.dart';
import 'core/platform/network-info.dart';
import 'features/covid-by-country/data/repository/get-covid-stats-all-countries-repo-impl.dart';
import 'features/covid-by-country/data/sources/get-covid-countries.stats-remote-data-source.dart';
import 'features/covid-by-country/domain/repository/get-covid-stats-all-countries-repo.dart';
import 'features/covid-by-country/domain/usecase/get-covid-stats-coutries.dart';
import 'features/covid-by-country/presentation/bloc/country_bloc.dart';
import 'features/covid-global/data/repository/get-covid-summary-repository-impl.dart';
import 'features/covid-global/data/repository/get-latest-articles-repo-impl.dart';
import 'features/covid-global/data/source/get-covid-summary-local-data-source.dart';
import 'features/covid-global/data/source/get-covid-summary-remote-data-source.dart';
import 'features/covid-global/data/source/get-latest-articles-remote-data-source.dart';
import 'features/covid-global/domain/repository/get-covid-summary-repository.dart';
import 'features/covid-global/domain/repository/get-latest-articles-repository.dart';
import 'features/covid-global/domain/usecase/get-covid-summary.dart';
import 'features/covid-global/domain/usecase/get-latest-articles.dart';
import 'features/covid-global/presentation/news-bloc/news_bloc_bloc.dart';
import 'features/covid-global/presentation/summary-bloc/summary_bloc.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //? Factories
  sl.registerFactory(() => SummaryBloc(getCovidSummary: sl()));
  sl.registerFactory(() => NewsBloc(getLatestArticles: sl()));
  sl.registerFactory(() => CountryBloc(getCovidStatsCountries: sl()));

  //? Usecases
  sl.registerLazySingleton(() => GetCovidSummary(repository: sl()));
  sl.registerLazySingleton(() => GetLatestArticles(repository: sl()));
  sl.registerLazySingleton(() => GetCovidStatsCountries(repository: sl()));

  //? Repositories
  Get.put(ThemeController());
  sl.registerLazySingleton<GetCovidSummaryRepository>(
      () => GetCovidSummaryRepositoryImpl(
            networkInfo: sl(),
            remoteDataSource: sl(),
            localDataSource: sl(),
          ));
  sl.registerLazySingleton<GetLatestNewsArticlesRepository>(
      () => GetLatestArticlesRepositoryImpl(source: sl(), networkInfo: sl()));

  sl.registerLazySingleton<GetCovidStatsCountriesRepository>(() =>
      GetCovidStatsCountriesRepositoryImpl(
          remoteDataSource: sl(), networkInfo: sl()));

  //? Data Sources
  sl.registerLazySingleton<GetCovidSummaryLocalDataSource>(
    () => GetCovidSummaryLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<GetCovidSummaryRemoteDataSource>(
    () => GetCovidSummaryRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<GetLatestArticlesRemoteDataSource>(
      () => GetLatestArticlesRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<GetCovidStatsConutriesRemoteDataSource>(
      () => GetCovidStatsConutriesRemoteDataSourceImpl(client: sl()));

  //? Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: sl()));

  //? external

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}
