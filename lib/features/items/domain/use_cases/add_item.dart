// lib/domain/usecases/add_item.dart
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/domain/repository/item_repository.dart';

class AddItem {
  final ItemRepository repository;

  AddItem(this.repository);

  Future<void> call(Item item) async {
    return await repository.addItem(item);
  }
}
