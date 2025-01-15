// lib/presentation/blocs/item_bloc.dart
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';

abstract class ItemEvent {}

class GetItemListEvent extends ItemEvent {}

class AddItemEvent extends ItemEvent {
  final String name;
  final String mark;
  final String quantity;

  AddItemEvent({required this.name, required this.mark, required this.quantity});
}

class IncreaseItemsQuantityEvent extends ItemEvent {
  final Item item;

  IncreaseItemsQuantityEvent({required this.item});
}
