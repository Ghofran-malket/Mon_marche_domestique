import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/categories/domain/entities/category.dart';
import 'package:mon_marche_domestique/features/categories/domain/use_cases/get_categories.dart';
import 'package:mon_marche_domestique/features/categories/presentations/bloc/category_event.dart';
import 'package:mon_marche_domestique/features/categories/presentations/bloc/category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories getCategories;
  
  CategoryBloc({required this.getCategories}) : super(CategoryLoadingState()) {
    on<GetCategoriesListEvent>((event, emit) async {
      emit(CategoryLoadingState());

      try {
        final List<Category> categories = await getCategories();
        emit(CategoryLoadedState(categories));
      } catch (e) {
        emit(CategoryErrorState('Failed to load categories: $e'));
      }
    });
  }
}
