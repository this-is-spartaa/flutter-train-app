import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/station_list/station_list_page.dart';

class StateBox extends StatelessWidget {
  const StateBox({
    super.key,
    required this.departure,
    required this.arrival,
    required this.onDepartureChanged,
    required this.onArrivalChanged,
  });
  final String? departure;
  final String? arrival;
  final void Function(String) onDepartureChanged;
  final void Function(String) onArrivalChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          station(
            context,
            '출발역',
            departure,
            onDepartureChanged,
          ),
          Container(
            width: 2,
            height: 50,
            color: Colors.grey[400],
          ),
          station(
            context,
            '도착역',
            arrival,
            onArrivalChanged,
          ),
        ],
      ),
    );
  }

  Expanded station(
    BuildContext context,
    String label,
    String? dest,
    void Function(String) onChanged,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return StationListPage(title: label);
              },
            ),
          );
          if (result != null) {
            onChanged(result);
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                dest ?? '선택',
                style: const TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
