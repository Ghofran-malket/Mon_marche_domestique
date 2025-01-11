// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/items/data/repository/item_repositoy_impl.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/add_item.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/get_items.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_bloc.dart';
import 'package:mon_marche_domestique/features/items/presentations/pages/add_item_page.dart';
import 'package:mon_marche_domestique/features/items/presentations/pages/items_list_page.dart';

void main() {
  final itemRepository = ItemRepositoryImpl();
  final getItems = GetItems(itemRepository);
  final addItem = AddItem(itemRepository);

  runApp(MyApp(
    getItems: getItems,
    addItem: addItem,
  ));
}

class MyApp extends StatelessWidget {
  final GetItems getItems;
  final AddItem addItem;

  MyApp({required this.getItems, required this.addItem});



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ItemBloc(getItems: getItems, addItem: addItem),
        child: MaterialApp(
          title: 'Flutter Clean Architecture',
          debugShowCheckedModeBanner: false,
          home: ItemListPage(),
          routes: {
            '/add': (context) => AddItemPage(),
          },
        ));
  }
}
