import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';

import '../../../core/utils/debouncer.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  SearchController searchController = SearchController();
  Debouncer debouncer = Debouncer(milliseconds: 500);

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
          key: const Key('search_bar_widget'),
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
              key: const Key('icon_button_location'),
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
                        final String cityName = locations[index].name!;
                        final String townshipItem = locations[index].state!;
                        return ListTile(
                          leading: Icon(Icons.location_pin),
                          title: Text(cityName),
                          subtitle: Text(townshipItem),
                          onTap: () {
                            controller.closeView(cityName);
                            context
                                .read<HomeBloc>()
                                .add(OnCityChanged(cityName));
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
}
