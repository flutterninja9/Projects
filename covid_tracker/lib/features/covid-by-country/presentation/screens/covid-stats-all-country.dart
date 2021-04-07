import '../../../../core/shared/loading-failed.dart';
import '../../../../core/shared/loading.dart';
import '../bloc/country_bloc.dart';
import '../widgets/countries-data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidStatusAllCountry extends StatefulWidget {
  @override
  _CovidStatusAllCountryState createState() => _CovidStatusAllCountryState();
}

class _CovidStatusAllCountryState extends State<CovidStatusAllCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: true,
              title: Text(
                'Choose your country',
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            BlocBuilder<CountryBloc, CountryState>(
              builder: (context, state) {
                if (state is CountryInitial) {
                  context.read<CountryBloc>().add(FetchCountriesTrigger());
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        //todo Replace this by linear indicator or shimmer
                        Loading(),
                      ],
                    ),
                  );
                } else if (state is CountryDataLoading) {
                  return SliverToBoxAdapter(
                    child: Loading(),
                  );
                } else if (state is CountryLoadingFailed) {
                  return SliverToBoxAdapter(
                    child: LoadingFailed(cause: state.failure.message),
                  );
                } else if (state is CountryDataLoaded) {
                  return CountriesData(countries: state.countries);
                }
                return SliverToBoxAdapter(
                  child: Container(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
