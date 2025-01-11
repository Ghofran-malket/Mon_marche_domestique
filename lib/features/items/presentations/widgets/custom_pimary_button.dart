import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  String label;
  VoidCallback  onPressed;
  CustomPrimaryButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              child: Text(label, style:TextStyle(color:Colors.white)),
              onPressed: onPressed,
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(double.minPositive,50)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
                elevation: MaterialStateProperty.all(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}