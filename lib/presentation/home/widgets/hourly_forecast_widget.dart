import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunshine/domain/entities/forecast_entity.dart';

import '../../../core/constants.dart';
import '../bloc/forecast_bloc.dart';
import '../bloc/forecast_state.dart';

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(builder: (context, state) {
      if (state is ForecastFailState) {
        return Text(state.errorMessage);
      }

      if (state is ForecastLoadedState) {
        return  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const  Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Today at',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            HourlyTemperatureListWidget(list: state.hourlyList),
            const  SizedBox(
              height: 8,
            ),
            HourlyWindListWidget(list: state.hourlyList),
          ],
        );
      }
      return Container();
    });
  }
}

class HourlyWindListWidget extends StatelessWidget {
  const HourlyWindListWidget({
    super.key, required this.
    list,
  });

  final List<ForecastEntity>
  list;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 152,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,

          itemBuilder: (context, index) {
            ForecastEntity item = list[index];
            return Padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? 16.0 : 0, right: index == 7 ? 16.0 : 0),
              child: HourlyWidget(
                time: item.hour!,
                value: '${item.windSpeed}km',
                image: RotationTransition(
                  turns:  AlwaysStoppedAnimation(item.windDegree / 360),
                  child: SvgPicture.asset(
                    'assets/icon/navigation.svg',
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 4,
            );
          },
          itemCount: 8),
    );
  }
}

class HourlyTemperatureListWidget extends StatelessWidget {
  const HourlyTemperatureListWidget({
    super.key,
    required this.list,
  });

  final List<ForecastEntity> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 152,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {

            ForecastEntity item = list[index];
            return Padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? 16.0 : 0, right: index == 7 ? 16.0 : 0),
              child: HourlyWidget(
                time: item.hour!,
                value: '${item.temperature}°',
                image: Image(
                  image: NetworkImage(
                    Urls.weatherIcon(
                      item.iconCode,
                    ),
                  ),
                  height: 64,
                  width: 64,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 4,
            );
          },
          itemCount: list.length),
    );
  }
}

class HourlyWidget extends StatelessWidget {
  const HourlyWidget(
      {super.key,
      required this.image,
      required this.time,
      required this.value});

  final Widget image;
  final String time;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 110,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            image,
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
