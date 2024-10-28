import 'package:flutter/material.dart';

class SeatListView extends StatelessWidget {
  const SeatListView({
    super.key,
    required this.selectedRow,
    required this.selectedCol,
    required this.onSelected,
  });
  final int? selectedRow;
  final int? selectedCol;
  final void Function(int row, int col) onSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          columnLabels(),
          ...List.generate(20, (i) => row(context, i + 1)),
        ],
      ),
    );
  }

  Row columnLabels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        listLabel('A'),
        const SizedBox(width: 4),
        listLabel('B'),
        const SizedBox(width: 4),
        listLabel(''),
        const SizedBox(width: 4),
        listLabel('C'),
        const SizedBox(width: 4),
        listLabel('D'),
      ],
    );
  }

  SizedBox listLabel(String label) {
    return SizedBox(
      width: 50,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget row(BuildContext context, int rowNum) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          seat(context, rowNum, 1),
          const SizedBox(width: 4),
          seat(context, rowNum, 2),
          const SizedBox(width: 4),
          listLabel('$rowNum'),
          const SizedBox(width: 4),
          seat(context, rowNum, 3),
          const SizedBox(width: 4),
          seat(context, rowNum, 4),
        ],
      ),
    );
  }

  Widget seat(BuildContext context, int rowNum, int colNum) {
    return GestureDetector(
      onTap: () {
        onSelected(rowNum, colNum);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: selectedRow == rowNum && selectedCol == colNum
              ? Colors.purple
              : Theme.of(context).disabledColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
