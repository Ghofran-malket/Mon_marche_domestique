
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/common_widgets/custom_drawer.dart';
import 'package:mon_marche_domestique/core/style.dart';
import 'package:mon_marche_domestique/features/categories/presentations/bloc/category_bloc.dart';
import 'package:mon_marche_domestique/features/categories/presentations/bloc/category_event.dart';
import 'package:mon_marche_domestique/features/categories/presentations/bloc/category_state.dart';
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
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

  String selectedCategory = 'All';

  @override
  void initState() {
    
    super.initState();
    context.read<ItemBloc>().add(GetItemListEvent());
    context.read<CategoryBloc>().add(GetCategoriesListEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: Colors.white, 
          ),
          
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CategoryLoadedState) {
                        return ListView.builder(
                            itemCount: state.categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ChoiceChip(
                                  label: Text(state.categories[index].name),
                                  selected: selectedCategory == state.categories[index].name,
                                  onSelected: (bool selected) {
                                    setState(() {
                                      selectedCategory = state.categories[index].name;
                                    });
                                  },
                                ),
                              );
                            },
                          );
                      } else if (state is CategoryErrorState) {
                        return Center(child: Text(state.message));
                      }
                      return Container();
                    }
                  ),
                ),
                
                SizedBox(height: 20),
               
                // Text("You have these items in your home:",style: bigTitle,),
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
                            
                            if(state.items[index].category == selectedCategory || selectedCategory == "All"){
                              return ItemListTile(item:Item(
                                name: state.items[index].name,
                                mark: state.items[index].mark,
                                quantity: state.items[index].quantity,
                                images: state.items[index].images,
                                description: state.items[index].description,
                                createdAt: state.items[index].createdAt,
                                expirationDate: state.items[index].expirationDate,
                                category: state.items[index].category
                              ));
                            }
                            else {return Container();}
                            
                            
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
