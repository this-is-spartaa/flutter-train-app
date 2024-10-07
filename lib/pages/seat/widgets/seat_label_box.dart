import 'package:flutter/material.dart';

class SeatLabelBox extends StatelessWidget {
  const SeatLabelBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seatLabel('선택됨', Colors.purple),
        const SizedBox(width: 20),
        seatLabel('선택됨', Colors.grey[300]!),
      ],
    );
  }

  Row seatLabel(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
