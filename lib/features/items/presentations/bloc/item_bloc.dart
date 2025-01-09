// lib/presentation/blocs/item_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/add_item.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/get_items.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_event.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final GetItems getItems;
  final AddItem addItem;

  ItemBloc({required this.getItems, required this.addItem}) : super(ItemLoadingState());

  
  Stream<ItemState> mapEventToState(ItemEvent event) async* {
    if (event is GetItemListEvent) {
      yield ItemLoadingState();
      try {
        final items = await getItems();
        yield ItemLoadedState(items);
      } catch (e) {
        yield ItemErrorState(e.toString());
      }
    } else if (event is AddItemEvent) {
      try {
        await addItem(Item(name: event.name, mark: event.mark, quantity: event.quantity));
        add(GetItemListEvent());  // Refresh the list
      } catch (e) {
        yield ItemErrorState(e.toString());
      }
    }
  }
}
