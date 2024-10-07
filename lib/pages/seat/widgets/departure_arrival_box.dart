import 'package:flutter/material.dart';

class DepartureArrivalBox extends StatelessWidget {
  const DepartureArrivalBox({
    super.key,
    required this.departure,
    required this.arrival,
  });

  final String departure;
  final String arrival;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Center(
            child: Text(departure),
          )),
          const Icon(
            Icons.arrow_circle_right_outlined,
            size: 30,
          ),
          Expanded(
            child: Center(
              child: Text(arrival),
            ),
          ),
        ],
      ),
    );
  }
}
