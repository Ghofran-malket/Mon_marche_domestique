import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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

  final TextEditingController dateController = TextEditingController();

  bool empty = false;
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F6),
      drawer: CustomDrawer(),
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
              Text("Add an item to your kitchen",style: bigTitle.copyWith(color: Colors.indigo),),
              SizedBox(height: 20,),
            
              CustomTextField(controller: nameController,labelText: 'Item name', icon: Icons.shopping_cart_outlined),
              CustomTextField(controller: markController,labelText: 'Mark', icon: Icons.local_offer_outlined),
              CustomTextField(controller: quantityController,labelText: 'Quantity', icon: Icons.view_module),
              CustomTextField(controller: descriptionController,labelText: 'Description', icon: Icons.description),

              Text("The expiration date", style: labelStyle.copyWith(color: Colors.indigo, fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              CustomTextField(controller: dateController,labelText: 'The expiration date', icon: Icons.date_range_outlined, onTap: ()=> _pickDate(context),),

              
              
              empty ? Text("These fields should be filled to complete the addition..", style:errorMsg,): Container(),
              CustomPrimaryButton(
                label:"Add item",
                onPressed: (){
                  final name = nameController.text;
                  final mark = markController.text;
                  final quantity = quantityController.text;
                  final description = descriptionController.text;
                  final date = DateFormat('dd/MM/yyyy').parse(dateController.text);
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
