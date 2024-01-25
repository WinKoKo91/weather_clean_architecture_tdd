import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/air_pollution_bloc.dart';
import '../../bloc/air_pollution_state.dart';
import 'air_quality_type_widget.dart';

class AirQualityWidget extends StatelessWidget {
  const AirQualityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AirPollutionBloc, AirPollutionState>(
        builder: (context, state) {
          if (state is AirPollutionFailState) {
            return Text(state.errorMessage);
          }

          if (state is AirPollutionLoadedState) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Air Quality Index',
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            color: state.qualitativeColor,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          state.qualitativeName!,
                          style:const TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.air,
                        size: 32,
                      ),
                      Column(
                        children: [
                          AirQualityTypeWidget(
                            value: state.data.pm2_5.toString(),
                            type: 'PM2.5',
                          ),
                          AirQualityTypeWidget(
                            value: state.data.no2.toString(),
                            type: 'NO2',
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          AirQualityTypeWidget(
                            value: state.data.so2.toString(),
                            type: 'SO2',
                          ),
                          AirQualityTypeWidget(
                            value: state.data.o3.toString(),
                            type: 'O3',
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          }
          return Container();
        });
  }
}