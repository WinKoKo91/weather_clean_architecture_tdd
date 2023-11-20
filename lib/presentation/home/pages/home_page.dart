import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../weather/bloc/weather_bloc.dart';

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
            padding: EdgeInsets.all(20),
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
                    onChanged: (value) {
                      cityName = value;
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
                        if (cityName == null || cityName!.isEmpty) {
                          const snackBar = SnackBar(
                            content: Text('City can\'t be empty'),
                            backgroundColor: Colors.redAccent,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }
                        context.goNamed('weather',
                            queryParameters: {"city": cityName!});
                      },
                      child: const Text("Search"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
