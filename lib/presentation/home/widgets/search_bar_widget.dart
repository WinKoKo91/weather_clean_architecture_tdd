import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/debouncer.dart';
import '../../../domain/entities/location.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../bloc/weather_event.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  SearchController searchController = SearchController();
  Debouncer debouncer = Debouncer(milliseconds: 1000);

  @override
  void initState() {
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        debouncer.run(() {
          context.read<HomeBloc>().add(OnCitySubmit(searchController.text));
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: searchController,
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.only(left: 16.0, right: 8.0)),
          leading: const Icon(Icons.search),
          onTap: controller.openView,
          onChanged: (_) {
            controller.openView();
          },
          onSubmitted: (value) {},
          trailing: [
            IconButton(
              onPressed: () {
                print("Click location");
              },
              icon: const Icon(
                Icons.my_location,
                color: Colors.white,
              ),
            )
          ],
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return [
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is HomeSearchCityResult) {
              var locations = state.locations;
              return locations.isEmpty
                  ? Container(height: 200, child: Icon(Icons.hourglass_empty))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        final String cityName = locations[index].name!;
                        final String townshipItem = locations[index].state!;
                        return ListTile(
                          leading: Icon(Icons.location_pin),
                          title: Text(cityName),
                          subtitle: Text(townshipItem),
                          onTap: () {

                            controller.closeView(cityName);
                            context
                                .read<WeatherBloc>()
                                .add(OnCityChanged(cityName));
                          },
                        );
                      });
            } else if (state is HomeCitySearchState) {
              return Container(
                  height: 200,
                  width: double.infinity,
                  child: const Center(
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
}
