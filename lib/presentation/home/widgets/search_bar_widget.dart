import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunshine/presentation/home/bloc/air_pollution_bloc.dart';
import 'package:sunshine/presentation/home/bloc/air_pollution_event.dart';

import '../../../core/utils/debouncer.dart';
import '../../../domain/entities/location.dart';
import '../bloc/forecast_bloc.dart';
import '../bloc/forecast_event.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/location_bloc.dart';
import '../bloc/location_event.dart';
import '../bloc/location_state.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,

  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late SearchController searchController = SearchController();
  Debouncer debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    searchController.addListener(searchListener);
    super.initState();
  }

  @override
  void dispose() {
    searchController.removeListener(searchListener);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return SearchAnchor(
      searchController: searchController,
      builder: (BuildContext context, SearchController controller) {
        return BlocConsumer<LocationBloc, LocationState>(
          listener: (context, state) {
            if (state is CurrentLocationLoaded) {
              onGetCurrentLocation(state.lat, state.lon);
            }
          },
          builder: (context, state) {
            return SearchBar(
              key: const Key('search_bar_widget'),
              hintText: 'Search city...',
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.only(left: 16.0, right: 8.0)),
              leading: const Icon(Icons.search),
              onTap: controller.openView,
              onChanged: (_) {
                controller.openView();
              },
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context.read<LocationBloc>().add(OnCitySubmit(value));
                }
              },
              trailing: [
                state is CurrentLocationLoading
                    ? Container(
                        height: 24,
                        width: 24,
                        margin: const EdgeInsets.only(right: 8),
                        child: const CircularProgressIndicator())
                    : IconButton(
                        key: const Key('icon_button_location'),
                        onPressed: () {
                          searchController.clear();
                          context
                              .read<LocationBloc>()
                              .add(GetCurrentLocation());
                        },
                        icon: const Icon(
                          Icons.my_location,
                          color: Colors.white,
                        ),
                      )
              ],
            );
          },
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return [
          BlocBuilder<LocationBloc, LocationState>(builder: (context, state) {
            if (state is LocationSearchSuccessState) {
              var locations = state.locations;
              return locations.isEmpty
                  ? const SizedBox(
                      height: 200, child: Icon(Icons.hourglass_empty))
                  : ListView.builder(
                      key: const Key('location_data'),
                      shrinkWrap: true,
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        final LocationEntity location = locations[index];
                        return ListTile(
                          leading: const Icon(Icons.location_pin),
                          title: Text(location.name!),
                          subtitle:
                              Text("${location.state}, ${location.country}"),
                          onTap: () {
                            controller.closeView(location.name!);
                            FocusScope.of(context).unfocus();
                            onGetCurrentLocation(location.lat!, location.lon!);
                          },
                        );
                      });
            } else if (state is LocationSearchingState) {
              return const SizedBox(
                  key: Key('searching_indicator'),
                  height: 200,
                  width: double.infinity,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )));
            } else {
              return Container();
            }
          })
        ];
      },
    );
  }

  void searchListener() {
    if (searchController.text.isNotEmpty) {
      debouncer.run(() {
        context.read<LocationBloc>().add(OnCitySubmit(searchController.text));
      });
    }
  }

  void onGetCurrentLocation(double lat, double lon) {
    context.read<HomeBloc>().add(WeatherByLocation(lat, lon));

    context.read<ForecastBloc>().add(OnGetForecastEvent(lat: lat, lon: lon));

    context
        .read<AirPollutionBloc>()
        .add(OnGetAirPollutionEvent(lat: lat, lon: lon));
  }
}
