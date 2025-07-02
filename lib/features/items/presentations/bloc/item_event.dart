// lib/presentation/blocs/item_bloc.dart
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';

abstract class ItemEvent {}

class GetItemListEvent extends ItemEvent {}

class AddItemEvent extends ItemEvent {
  final String name;
  final String mark;
  final String quantity;
  final DateTime createdAt;
  final DateTime expirationDate;
  List images;
  final String description;
  final String category;

  AddItemEvent({required this.name, required this.mark, required this.quantity, required this.createdAt,
                required this.expirationDate, required this.images, required this.description, required this.category});
}

class IncreaseItemsQuantityEvent extends ItemEvent {
  final Item item;

  IncreaseItemsQuantityEvent({required this.item});
}

class MinusItemsQuantityEvent extends ItemEvent {
  final Item item;

  MinusItemsQuantityEvent({required this.item});
}

class UploadFileEvent extends ItemEvent {}
