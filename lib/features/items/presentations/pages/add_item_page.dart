import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/core/style.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_bloc.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_event.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custom_pimary_button.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custom_text_field.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custome_appbar.dart';

class AddItemPage extends StatefulWidget {
  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController markController = TextEditingController();

  final TextEditingController quantityController = TextEditingController();

  bool empty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomeAppBar(
        title: 'Add new item',
        icon: Icons.arrow_back_ios,   
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add an item to your kitchen",style: bigTitle,),
              SizedBox(height: 20,),
              CustomTextField(controller: nameController,labelText: 'item name',),
              CustomTextField(controller: markController,labelText: 'mark',),
              CustomTextField(controller: quantityController,labelText: 'quantity',),
              empty ? Text("These fields should be filled..", style:TextStyle(color:Colors.red[400])): Container(),
              CustomPrimaryButton(
                label:"Add item",
                onPressed: (){
                  final name = nameController.text;
                  final mark = markController.text;
                  final quantity = quantityController.text;
                  if (name == "" || mark == "" || quantity == ""){
                    setState(() {
                      empty = true;
                    });
                  }else{
                    context.read<ItemBloc>().add(AddItemEvent(name: name, mark: mark, quantity: quantity));
                    Navigator.pop(context);
                  }
                  
                }
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
