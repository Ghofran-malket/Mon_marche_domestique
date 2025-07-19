
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';

class ItemModel extends Item {
  ItemModel({required String name, required String mark, required String quantity, required DateTime createdAt,
      required DateTime expirationDate, required List images, required String description, required String category})
      : super(name: name, mark: mark, quantity: quantity, createdAt:  createdAt, 
      expirationDate: expirationDate, images: images, description: description, category: category);

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(name: json['name'], mark: json['mark'], quantity: json['quantity'],
    createdAt: json['createdAt'].toDate(), expirationDate: json['expirationDate'].toDate(), 
    images: json['images'], description: json['description'],
    category: json['category']);
  }
  
  Map<String, dynamic> toFirestore() {
    return {'name': name, 'mark': mark, 'quantity': quantity, 'createdAt': createdAt, 'expirationDate': expirationDate, 'images': images, 'description': description, 'category': category};
  }

  factory ItemModel.fromFirestore(Map<String, dynamic> firestore) {
    return ItemModel(
      name: firestore['name'],
      mark: firestore['mark'],
      quantity: firestore['quantity'],
      createdAt: firestore['createdAt'].toDate(),
      expirationDate: firestore['expirationDate'].toDate(),
      images: firestore['images'],
      description: firestore['description'],
      category: firestore['category']
    );
  }
}
