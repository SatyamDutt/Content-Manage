import 'package:flutter/material.dart';

class PrimaryTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController? inputValue;
  final TextInputType? inputType;
  const PrimaryTextfield({
    super.key,
    required this.hintText,
    this.inputValue,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputValue,
      keyboardType: inputType,
      obscureText: false,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
