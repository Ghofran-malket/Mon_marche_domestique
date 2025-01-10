
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_bloc.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_event.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_state.dart';

class ItemListPage extends StatefulWidget {

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {

  @override
  void initState() {
    
    super.initState();
    context.read<ItemBloc>().add(GetItemListEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item List')),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ItemLoadedState) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.items[index].name),
                  subtitle: Text(state.items[index].mark),
                );
              },
            );
          } else if (state is ItemErrorState) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
