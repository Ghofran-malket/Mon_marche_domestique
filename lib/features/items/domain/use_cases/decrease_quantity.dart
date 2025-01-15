// lib/domain/usecases/get_items.dart
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/domain/repository/item_repository.dart';

class DecreaseItemsQuantity {
  final ItemRepository repository;

  DecreaseItemsQuantity(this.repository);
  
  void call(Item item) {
    repository.decreaseQuantity(item);
  }
}

