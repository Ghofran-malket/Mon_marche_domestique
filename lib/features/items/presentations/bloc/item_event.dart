// lib/presentation/blocs/item_bloc.dart
abstract class ItemEvent {}

class GetItemListEvent extends ItemEvent {}

class AddItemEvent extends ItemEvent {
  final String name;
  final String mark;
  final String quantity;

  AddItemEvent({required this.name, required this.mark, required this.quantity});
}
