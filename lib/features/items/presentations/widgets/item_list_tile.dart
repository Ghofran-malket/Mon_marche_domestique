import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_bloc.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_event.dart';
import 'package:mon_marche_domestique/features/items/presentations/pages/item_details_page.dart';

class ItemListTile extends StatelessWidget {
  final Item item;
  ItemListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemDetailsPage(item: item)));
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
                        Text("Item ${item.name}"),
                        Text("Mark ${item.mark}")
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed:(){
                            context.read<ItemBloc>().add(IncreaseItemsQuantityEvent(item:item));
                          },
                          icon: Icon(Icons.add_circle,color: Colors.indigo[600],)
                        ),
                        
                        Text("Quantity: ${item.quantity}"),
                        IconButton(
                          onPressed:(){
                            context.read<ItemBloc>().add(MinusItemsQuantityEvent(item: item));
                          },
                          icon: Icon(Icons.remove_circle,color: Colors.indigo[600],)
                        ),
                      ],
                    )
                  ],
                ),
              
        ),
      ),
    );
  }
}