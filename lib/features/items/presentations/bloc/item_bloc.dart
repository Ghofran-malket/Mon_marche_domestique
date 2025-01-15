// lib/presentation/blocs/item_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/add_item.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/decrease_quantity.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/get_items.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/increase_quantity.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_event.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final GetItems getItems;
  final AddItem addItem;
  final IncreaseItemsQuantity increaseItemsQuantity;
  final DecreaseItemsQuantity decreaseItemsQuantity;

  ItemBloc({required this.getItems, required this.addItem, required this.increaseItemsQuantity, required this.decreaseItemsQuantity}) : super(ItemLoadingState()) {
    // Register the handler for GetItemListEvent using on<Event>
    on<GetItemListEvent>((event, emit) async {
      // Yield ItemLoadingState while the items are being fetched
      emit(ItemLoadingState());

      try {
        // Fetch the items using the GetItems use case
        final items = getItems();
        // On success, yield the ItemLoadedState with the list of items
        emit(ItemLoadedState(items));
      } catch (e) {
        // On error, yield the ItemErrorState with an error message
        emit(ItemErrorState('Failed to load items: $e'));
      }
    });
    on<AddItemEvent>((event, emit) async {
      // Yield ItemLoadingState while the items are being fetched
      emit(ItemLoadingState());

      try {
        addItem(Item(name: event.name, mark: event.mark, quantity: event.quantity));
        final items = getItems();
        emit(ItemLoadedState(items));
      } catch (e) {
        // On error, yield the ItemErrorState with an error message
        emit(ItemErrorState('Failed to load items: $e'));
      }
    });

    on<IncreaseItemsQuantityEvent>((event, emit) async{
      try{
        increaseItemsQuantity(event.item);
        final items = getItems();
        emit(ItemLoadedState(items));
      }catch(e){
        emit(ItemErrorState('Failed to increase item\'s quantity: $e'));
      }
    }); 

    on<MinusItemsQuantityEvent>((event, emit) async{
      try{
        decreaseItemsQuantity(event.item);
        final items = getItems();
        emit(ItemLoadedState(items));
      }catch(e){
        emit(ItemErrorState('Failed to increase item\'s quantity: $e'));
      }
    }); 

  }
}
