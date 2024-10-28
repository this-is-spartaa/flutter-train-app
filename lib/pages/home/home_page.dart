import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/widgets/station_box.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? departure;
  void onDepartureChanged(String v) {
    setState(() {
      departure = v;
    });
  }

  String? arrival;
  void onArrivalChanged(String v) {
    setState(() {
      arrival = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기차 예매'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StateBox(
              departure: departure,
              arrival: arrival,
              onDepartureChanged: onDepartureChanged,
              onArrivalChanged: onArrivalChanged,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (departure != null && arrival != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SeatPage(
                            departure: departure!,
                            arrival: arrival!,
                          );
                        },
                      ),
                    );
                  }
                },
                child: const Text('좌석 선택'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
