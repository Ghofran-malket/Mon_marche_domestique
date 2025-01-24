import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';

abstract class ItemRepository {
  // Method to get the list of items
  Future<List<Item>> getItems();

  // Method to add a new item or updation his quantity if it's exist 
  Future<void> addOrUpdateItem(Item item);

  void increseQuantity(Item item);

  void decreaseQuantity(Item item);
}
