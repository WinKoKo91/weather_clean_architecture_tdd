import 'package:flutter/material.dart';

class SunriseAndSunsetWidget extends StatelessWidget {
  final String sunrise, sunset;

  const SunriseAndSunsetWidget(
      {super.key, required this.sunset, required this.sunrise});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sunrise & Sunset',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.sunny,
                    size: 32,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Sunrise',
                          style: TextStyle(color: Colors.grey)),
                      Text(
                        sunrise,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.nights_stay_outlined,
                    size: 32,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Sunrise',
                          style: TextStyle(color: Colors.grey)),
                      Text(
                        sunset,
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}