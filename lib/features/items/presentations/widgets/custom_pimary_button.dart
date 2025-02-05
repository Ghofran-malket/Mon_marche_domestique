import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback  onPressed;
  CustomPrimaryButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(double.minPositive,50)),
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.indigo),
                elevation: WidgetStatePropertyAll(12),
              ),
              child: Text(label, style:TextStyle(color:Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}