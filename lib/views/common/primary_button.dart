import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? ontTap;
  final String title;
  const PrimaryButton({super.key, required this.ontTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 56,
      child: MaterialButton(
        // color: Colors.blue,
        color: Color(0xff1d2f47),
        onPressed: ontTap,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
            ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
