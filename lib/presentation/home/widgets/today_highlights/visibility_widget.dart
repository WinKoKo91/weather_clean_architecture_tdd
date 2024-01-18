import 'package:flutter/material.dart';

class VisibilityWidget extends StatelessWidget {
  const VisibilityWidget({
    super.key,
    required this.visibility,
  });

  final String visibility;

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
            'Visibility',
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
                Icons.visibility_outlined,
                size: 32,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    visibility,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'km',
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