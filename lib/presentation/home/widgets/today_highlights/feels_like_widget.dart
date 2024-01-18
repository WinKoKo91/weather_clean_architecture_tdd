import 'package:flutter/material.dart';

class FeelsLikeWidget extends StatelessWidget {
  const FeelsLikeWidget({
    super.key,
    required this.feelsLike,
  });

  final String feelsLike;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Feels Like',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.thermostat,
                size: 32,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    feelsLike,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    '°C',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
