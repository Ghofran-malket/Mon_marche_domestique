import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback  onPressed;
  CustomPrimaryButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:  ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
          foregroundColor: Colors.white, backgroundColor: Colors.indigo, // Text color
          shadowColor: Colors.blueAccent, // Shadow color
          elevation: 5, // Shadow elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Custom Border Radius
          ),
          padding: EdgeInsets.symmetric(horizontal: Checkbox.width, vertical: 10), // Padding
        ),
        child: Text(label, style:TextStyle(color:Colors.white)),
      )
    );
  }
}