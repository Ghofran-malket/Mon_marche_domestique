// lib/data/repositories/item_repository_impl.dart
import 'package:mon_marche_domestique/features/items/data/model/item_model.dart';
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/domain/repository/item_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ItemRepositoryImpl implements ItemRepository {
  final db = FirebaseFirestore.instance;

  Future<QuerySnapshot> findItemByName(Item item) async {
     return await db
          .collection('items')
          .where('name', isEqualTo: item.name).where('mark', isEqualTo: item.mark)
          .get(); 
  }

  @override
  Future<List<Item>> getItems() async {
    try {
      var snapshot = await db.collection('items').get();
      return snapshot.docs.map((doc) {
        return ItemModel.fromFirestore(doc.data());
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch items: $e');
    }
  }

  @override
  Future<void> addOrUpdateItem(Item item) async {
    try {
      QuerySnapshot querySnapshot = await findItemByName(item);

      if (querySnapshot.docs.isNotEmpty) {
        var existingItemDoc = querySnapshot.docs.first;
        var existingItemModel = ItemModel.fromFirestore(existingItemDoc.data() as Map<String, dynamic>);
      
        int newQuantity = int.parse(existingItemModel.quantity) + int.parse(item.quantity);

        await db.collection('items').doc(existingItemDoc.id).update({
          'quantity': newQuantity.toString(),
        });

        print('Item quantity updated!');
      } else {

        ItemModel model = ItemModel(name: item.name, mark: item.mark, quantity: item.quantity);
        await db.collection('items').add(model.toFirestore());

        print('New item added!');
      }
    } catch (e) {
      print('Error adding or updating item: $e');
      throw Exception('Failed to add or update item');
    }
  }

  @override
  Future increseQuantity(Item item) async{
    try {
      QuerySnapshot querySnapshot = await findItemByName(item);

      if (querySnapshot.docs.isNotEmpty) {
        var existingItemDoc = querySnapshot.docs.first;
      
        int newQuantity = int.parse(item.quantity) + 1;

        await db.collection('items').doc(existingItemDoc.id).update({
          'quantity': newQuantity.toString(),
        });

        print('Item quantity increased by one!');
      }
    } catch (e) {
      print('Error increasing item\'s quantity: $e');
      throw Exception('Failed to increase item\'s quantity');
    }
  }

  @override
  Future decreaseQuantity(Item item) async{
    try {
      QuerySnapshot querySnapshot = await findItemByName(item);

      if (querySnapshot.docs.isNotEmpty) {
        var existingItemDoc = querySnapshot.docs.first;

        if(int.parse(item.quantity) > 1){
          int newQuantity = int.parse(item.quantity) - 1;

          await db.collection('items').doc(existingItemDoc.id).update({
            'quantity': newQuantity.toString(),
          });
          print('Item quantity decreased by one!');
        }else {
          await db.collection('items').doc(existingItemDoc.id).delete();
        }
      }
    } catch (e) {
      print('Error decreasing item\'s quantity: $e');
      throw Exception('Failed to decrease item\'s quantity');
    }
  }

  Future<Map<String, dynamic>> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    return json.decode(jsonString);
  }

  @override
  Future<void> uploadJsonToFirestore() async {
    
    Map<String, dynamic> jsonData = await loadJsonData();
    
    //convert JSON list into documents
    List<dynamic> dataList = jsonData['items'];

    // Upload each item as a Firestore document
    CollectionReference collection = FirebaseFirestore.instance.collection('items');
    
    for (var item in dataList) {
      item['created_at'] = DateTime.now();
      await collection.add(item);
    }
  }

}
