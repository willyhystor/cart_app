import 'package:flutter/material.dart';

class ModalTip extends StatelessWidget {
  const ModalTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
