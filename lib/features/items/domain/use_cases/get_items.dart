// lib/domain/usecases/get_items.dart
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/domain/repository/item_repository.dart';

class GetItems {
  final ItemRepository repository;

  GetItems(this.repository);
  
  List<Item> call() {
    return repository.getItems();
  }
}

