// lib/presentation/blocs/item_bloc.dart

import 'package:mon_marche_domestique/features/categories/domain/entities/category.dart';

abstract class CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<Category> categories;

  CategoryLoadedState(this.categories);
}

class CategoryErrorState extends CategoryState {
  final String message;

  CategoryErrorState(this.message);
}
