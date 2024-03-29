import 'package:flutter/material.dart';

class AirQualityTypeWidget extends StatelessWidget {
  const AirQualityTypeWidget({
    super.key,
    required this.value,
    required this.type,
  });

  final String value;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          type,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
        )
      ],
    );
  }
}