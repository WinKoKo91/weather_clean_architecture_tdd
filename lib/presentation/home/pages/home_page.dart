import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';

import '../../weather/bloc/weather_bloc.dart';
import '../../weather/bloc/weather_event.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        child: Card(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(20),
            child: BlocListener<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is HomeSuccessState) {
                  context.goNamed('weather',
                      queryParameters: {'city': state.cityName});
                } else if (state is HomeFailState) {
                  var snackBar = SnackBar(
                    content: Text(state.errorMessage),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/sunshine.png',
                          height: 80,
                          width: 80,
                        ),
                        const Text('Sun Shine Weather'),
                      ],
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      controller: TextEditingController(text: cityName),
                      onChanged: (value) {
                        cityName = value;
                      },
                      onSubmitted: (value) {
                        context.read<HomeBloc>().add(OnCitySubmit(value!));
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter city name',
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(OnCitySubmit(cityName!));
                        },
                        child: const Text("Search"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
