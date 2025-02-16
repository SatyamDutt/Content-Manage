import 'package:flutter/material.dart';

class Tagline extends StatelessWidget {
  final String title;
  const Tagline({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 22,
        color: Colors.blue,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
