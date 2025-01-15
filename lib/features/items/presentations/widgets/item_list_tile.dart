import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_bloc.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_event.dart';

class ItemListTile extends StatelessWidget {
  String itemName;
  String itemMark;
  String itemQuantity;
  ItemListTile({super.key, required this.itemName, required this.itemMark, required this.itemQuantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8),
      child: InkWell(
        onTap: (){
          print("There is $itemName of the $this.itemName");
        },
        child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color:Colors.white,
                  boxShadow:[ 
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.indigo[200]!
                    )
                  ], 
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Item $itemName"),
                        Text("Mark $itemMark")
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed:(){
                            context.read<ItemBloc>().add(IncreaseItemsQuantityEvent(item:Item(name: itemName, mark: itemMark, quantity: itemQuantity)));
                          },
                          icon: Icon(Icons.add_circle,color: Colors.indigo[600],)
                        ),
                        
                        Text("Quantity: $itemQuantity"),
                        
                      ],
                    )
                  ],
                ),
              
        ),
      ),
    );
  }
}