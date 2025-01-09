// lib/data/repositories/item_repository_impl.dart
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/domain/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final List<Item> _items = [];  // Simple in-memory storage for this example

  @override
  Future<List<Item>> getItems() async {
    return _items;
  }

  @override
  Future<void> addItem(Item item) async {
    _items.add(item);
  }
}
