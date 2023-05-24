import 'package:flutter/material.dart';

class UnKnownRoutePage extends StatelessWidget {
  const UnKnownRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(222);
        Navigator.of(context).pop(111);
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
    );
  }
}
