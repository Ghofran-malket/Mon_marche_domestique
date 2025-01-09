
import 'package:flutter/material.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/item_list_tile.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar:  AppBar(
        title: const Text("Mon marche domestique"),
        leading: const Icon(Icons.menu),
      ),
      body: Padding(
        padding:  EdgeInsets.all(20),
        child: Column(
          children: [
            ItemListTile(itemName: "Riz", itemQuantity: "2", itemMark: "Chetoura"),
            ItemListTile(itemName: "Boulgour", itemQuantity:"3", itemMark: "Chetoura"),
            ItemListTile(itemName: "Semoul", itemQuantity:"1", itemMark: "Chetoura"),
            ItemListTile(itemName: "Pois chich", itemQuantity:"4", itemMark: "Chetoura"),
          ]
        ),
      ),
    );
  }

}