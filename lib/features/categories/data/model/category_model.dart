

import 'package:mon_marche_domestique/features/categories/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({required super.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name']);
  }
  
  Map<String, dynamic> toFirestore() {
    return {'name': name};
  }

  factory CategoryModel.fromFirestore(Map<String, dynamic> firestore) {
    return CategoryModel(
      name: firestore['name']
    );
  }
}
