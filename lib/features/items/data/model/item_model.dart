
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';

class ItemModel extends Item {
  ItemModel({required String name, required String mark, required String quantity, required DateTime createdAt,
      required DateTime expirationDate, required List image, required String description})
      : super(name: name, mark: mark, quantity: quantity, createdAt:  createdAt, expirationDate: expirationDate, image: image, description: description);

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(name: json['name'], mark: json['mark'], quantity: json['quantity'],
    createdAt: json['createdAt'].toDate(), expirationDate: json['expirationDate'].toDate(), image: json['image'], description: json['description']);
  }
  
  Map<String, dynamic> toFirestore() {
    return {'name': name, 'mark': mark, 'quantity': quantity, 'createdAt': createdAt, 'expirationDate': expirationDate, 'image': image, 'description': description};
  }

  factory ItemModel.fromFirestore(Map<String, dynamic> firestore) {
    return ItemModel(
      name: firestore['name'],
      mark: firestore['mark'],
      quantity: firestore['quantity'],
      createdAt: firestore['createdAt'].toDate(),
      expirationDate: firestore['expirationDate'].toDate(),
      image: firestore['image'],
      description: firestore['description'],
    );
  }
}
