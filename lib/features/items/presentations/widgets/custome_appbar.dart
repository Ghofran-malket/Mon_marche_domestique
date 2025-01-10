import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final IconData icon;
  const CustomeAppBar({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title,),
        leading: IconButton(
          icon: Icon(icon),
          onPressed: (){},
        ),
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}