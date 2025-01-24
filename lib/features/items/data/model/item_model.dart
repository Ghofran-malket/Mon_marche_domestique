
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';

class ItemModel extends Item {
  ItemModel({required String name, required String mark, required String quantity})
      : super(name: name, mark: mark, quantity: quantity);

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(name: json['name'], mark: json['mark'], quantity: json['quantity']);
  }
  
  Map<String, dynamic> toFirestore() {
    return {'name': name, 'mark': mark, 'quantity': quantity};
  }

  factory ItemModel.fromFirestore(Map<String, dynamic> firestore) {
    return ItemModel(
      name: firestore['name'],
      mark: firestore['mark'],
      quantity: firestore['quantity']
    );
  }
}
