import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/widgets/departure_arrival_box.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat_label_box.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat_list_view.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({
    super.key,
    required this.departure,
    required this.arrival,
  });
  final String departure;
  final String arrival;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  int? selectedCol;

  void onSelected(int row, int col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('좌석 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            DepartureArrivalBox(
              departure: widget.departure,
              arrival: widget.arrival,
            ),
            const SizedBox(height: 10),
            const SeatLabelBox(),
            SeatListView(
              selectedRow: selectedRow,
              selectedCol: selectedCol,
              onSelected: onSelected,
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedRow != null && selectedCol != null) {
                    final colName = ['', 'A', 'B', 'C', 'D'][selectedCol!];
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text("예매 하시겠습니까?"),
                        content: Text('좌석 : $selectedRow-$colName'),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "취소",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "확인",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text("예매 하기"),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
