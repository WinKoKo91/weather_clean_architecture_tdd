import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunshine/domain/entities/forecast_entity.dart';
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart';
import 'package:sunshine/presentation/home/bloc/forecast_state.dart';

import '../../../core/constants.dart';

class WeatherForecastWidget extends StatelessWidget {
  const WeatherForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(builder: (context, state) {
      if (state is ForecastFailState) {
        return Text(state.errorMessage);
      }

      if (state is ForecastLoadedState) {
        return Container(
          key: const Key('forecast_data'),
          padding:const  EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                ' 5 days forecast',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Card(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    ForecastEntity forecast = state.dailyList[index];
                    return ListTile(
                      minLeadingWidth: 128,
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image(
                            width: 40,
                            height: double.infinity,
                            image: NetworkImage(
                              Urls.weatherIcon(
                                forecast.iconCode,
                              ),
                            ),
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${forecast.temperature}°',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      title: Text(
                        forecast.date ?? '2 Mar',
                      ),
                      trailing: Text(forecast.day ?? 'Thrusday'),
                    );
                  },
                  itemCount: state.dailyList.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 2,
                  ),
                ),
              )
            ],
          ),
        );
      }
      return Container();
    });
  }
}
