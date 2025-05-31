import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final IconData icon;
  const CustomeAppBar({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
        title: Text(title,style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(icon,color: Colors.white),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}