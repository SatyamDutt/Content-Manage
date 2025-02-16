import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String title;
  const InputLabel({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
