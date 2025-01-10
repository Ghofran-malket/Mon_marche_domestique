// lib/data/repositories/item_repository_impl.dart
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/domain/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final List<Item> _items = [Item(name:"Riz",mark:"Chetoura",quantity:"2")];  // Simple in-memory storage for this example

  @override
  List<Item> getItems() {
    return _items;
  }

  @override
  Future<void> addItem(Item item) async {
    _items.add(item);
  }
}
