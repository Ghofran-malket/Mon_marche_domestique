import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_bloc.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_event.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custome_appbar.dart';

class AddItemPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController markController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomeAppBar(
        title: 'Add new item',
        icon: Icons.arrow_back_ios,   
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: markController,
              decoration: InputDecoration(labelText: 'mark'),
            ),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final mark = markController.text;
                final quantity = quantityController.text;
                context.read<ItemBloc>().add(AddItemEvent(name: name, mark: mark, quantity: quantity));
                Navigator.pop(context);  // Return to item list
              },
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
