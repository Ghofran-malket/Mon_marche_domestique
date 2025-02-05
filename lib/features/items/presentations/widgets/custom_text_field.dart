import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  CustomTextField(
      {super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5.0, color: Colors.indigo[200]!)],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextField(
          controller: controller,
          keyboardType: (labelText == 'quantity') ? TextInputType.number: TextInputType.text,
          maxLength: (labelText == 'quantity') ? 2 : 20,
          showCursor: false,
          decoration: InputDecoration(
              labelText: labelText,
              counterText: "",
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.indigo[200]!),
              constraints: const BoxConstraints(maxHeight: 50)),
        ),
      ),
    );
  }
}
