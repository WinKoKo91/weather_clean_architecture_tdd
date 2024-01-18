import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PressureWidget extends StatelessWidget {
  const PressureWidget({
    super.key,
    required this.pressure,
  });

  final String pressure;

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
            'Pressure',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icon/icon_airwave.svg',
                height: 32,
                width: 32,
                colorFilter:
                const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    pressure,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'hPa',
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