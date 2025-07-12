import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mon_marche_domestique/features/categories/data/model/category_model.dart';
import 'package:mon_marche_domestique/features/categories/domain/repository/category_repository.dart';
import '../../domain/entities/category.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<Category>> getCategories() async {
    try {
      var snapshot = await db.collection('categories').orderBy('name').get();
      return snapshot.docs.map((doc) {
        return CategoryModel.fromFirestore(doc.data());
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }
}
