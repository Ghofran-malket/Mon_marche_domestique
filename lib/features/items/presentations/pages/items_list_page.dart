
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/core/style.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_bloc.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_event.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_state.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/item_list_tile.dart';

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
      appBar: AppBar(
        title: Text('Mon marche domestique',),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("You have these items in your home:",style: bigTitle,),
            BlocBuilder<ItemBloc, ItemState>(
              builder: (context, state) {
                if (state is ItemLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ItemLoadedState) {
                  return ListView.builder(
                    itemCount: state.items.length,
                    padding: EdgeInsets.symmetric(vertical:10),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ItemListTile(itemName: state.items[index].name, itemQuantity: state.items[index].quantity, itemMark: state.items[index].mark);
                      
                    },
                  );
                } else if (state is ItemErrorState) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, '/add');
        },
      ),
    );
  }
}
