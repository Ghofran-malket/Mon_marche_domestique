import 'package:flutter/material.dart';
import 'package:mon_marche_domestique/core/style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  CustomTextField(
      {super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.indigo[600]!)],
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: TextField(
          controller: controller,
          keyboardType: (labelText == 'Quantity' || labelText == 'Day' || labelText == 'Month' || labelText == 'Year') ? TextInputType.number: TextInputType.text,
          maxLength: 
            (labelText == 'Quantity' || labelText == 'Day' || labelText == 'Month') ? 2 : (labelText == 'Year') ? 4 : 20,
    
          showCursor: false,
          decoration: InputDecoration(
              labelText: labelText,
              counterText: "",
              border: InputBorder.none,
              labelStyle: labelStyle,
              constraints: const BoxConstraints(maxHeight: 50, minWidth: 110)
          ),
        ),
      ),
    );
  }
}
