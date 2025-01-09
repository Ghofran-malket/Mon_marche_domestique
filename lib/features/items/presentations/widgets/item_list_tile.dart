import 'package:flutter/material.dart';

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
                      color: Colors.red[200]!
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
                    Text("Quantity: $itemQuantity")
                  ],
                ),
              
        ),
      ),
    );
  }
}