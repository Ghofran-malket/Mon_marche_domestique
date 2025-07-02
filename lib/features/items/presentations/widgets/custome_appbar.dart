import 'package:flutter/material.dart';
import 'package:mon_marche_domestique/core/style.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final IconData icon;
  final Color color;
  const CustomeAppBar({super.key, required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.indigo,
        title: Text(title,style: bigTitle.copyWith(color: color),),
        leading: IconButton(
          icon: Icon(icon,color: color),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}