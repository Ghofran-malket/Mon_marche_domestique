import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/common_widgets/custom_drawer.dart';
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

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  bool empty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: const CustomeAppBar(
        title: 'Add a new item to your kitchen',
        icon: Icons.menu,
        color: Colors.white,
      ),
      
      body: SingleChildScrollView(
         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Text("Add an item to your kitchen",style: bigTitle.copyWith(color: Colors.indigo),),
              SizedBox(height: 20,),
              CustomTextField(controller: nameController,labelText: 'Item name',),
              CustomTextField(controller: markController,labelText: 'Mark',),
              CustomTextField(controller: quantityController,labelText: 'Quantity',),
              CustomTextField(controller: descriptionController,labelText: 'Description',),

              Text("The expiration date", style: labelStyle.copyWith(color: Colors.indigo, fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: CustomTextField(controller: dayController,labelText: 'Day',)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomTextField(controller: monthController,labelText: 'Month',),
                  )),
                  Expanded(child: CustomTextField(controller: yearController,labelText: 'Year',)),

                ],
              ),
              
              empty ? Text("These fields should be filled to complete the addition..", style:errorMsg,): Container(),
              CustomPrimaryButton(
                label:"Add item",
                onPressed: (){
                  final name = nameController.text;
                  final mark = markController.text;
                  final quantity = quantityController.text;
                  final description = descriptionController.text;
                  final date = DateTime(int.parse(yearController.text), int.parse(monthController.text), int.parse(dayController.text));
                  if (name == "" || mark == "" || quantity == "" || description == ""){
                    setState(() {
                      empty = true;
                    });
                  }else{
                    context.read<ItemBloc>().add(AddItemEvent(name: name, mark: mark, quantity: quantity, createdAt: DateTime.now(), 
                    expirationDate: date, images: [], description: description, category: "All" ));
                    Navigator.pop(context);
                  }
                  
                }
              ),
              
            ],
          ),
        ),
      
    );
  }
}
