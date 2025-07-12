
import 'package:mon_marche_domestique/features/categories/domain/entities/category.dart';
import 'package:mon_marche_domestique/features/categories/domain/repository/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);
  
  Future<List<Category>> call() {
    return repository.getCategories();
  }
}

