import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';

abstract class ItemState {}

class ItemLoadingState extends ItemState {}

class ItemLoadedState extends ItemState {
  final List<Item> items;

  ItemLoadedState(this.items);
}

class ItemErrorState extends ItemState {
  final String message;

  ItemErrorState(this.message);
}
