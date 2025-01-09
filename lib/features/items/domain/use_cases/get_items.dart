// lib/domain/usecases/get_items.dart
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';

abstract class GetItems {
  Future<List<Item>> call();
}

