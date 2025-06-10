
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/common_widgets/custom_drawer.dart';
import 'package:mon_marche_domestique/core/style.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_bloc.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_event.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_state.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custome_appbar.dart';
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
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
          opacity: 0.6,
          colorFilter: ColorFilter.mode(Colors.indigo[400]!, BlendMode.dstATop) 
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: CustomDrawer(),
          appBar: const CustomeAppBar(
            title: 'Mon marche domestique',
            icon: Icons.menu,   
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
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.items.length,
                          padding: EdgeInsets.only(left:10, right:10, bottom:50),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ItemListTile(itemName: state.items[index].name, itemQuantity: state.items[index].quantity, itemMark: state.items[index].mark);
                            
                          },
                        ),
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
          floatingActionButton: Container(
            height:60,width:60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo[600],
            ),
            child: InkWell(
              child: Icon(
                Icons.add,
                size: 40,
                color:Colors.white,
              ),
              onTap: (){
                Navigator.pushNamed(context, '/add');
              },
            ),
            
          ),
        ),
      
    );
  }
}
