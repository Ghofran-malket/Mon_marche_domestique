// lib/data/repositories/item_repository_impl.dart
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/domain/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final List<Item> _items = [
    Item(name:"Riz",mark:"Chetoura",quantity:"2"),
    Item(name:"Boulgour",mark:"Chetoura",quantity:"1"),
    Item(name:"Semoul",mark:"Chetoura",quantity:"4"),
    Item(name:"Pois chich",mark:"Chetoura",quantity:"1"),
    Item(name:"Petit pois",mark:"Chetoura",quantity:"2"),
    Item(name:"Feve",mark:"Chetoura",quantity:"3"),
    
  ];

  @override
  List<Item> getItems() {
    return _items;
  }

  @override
  void addItem(Item item) {
    _items.add(item);
  }

  @override
  bool checkForItem(Item item) {
    bool exist= false;
    int index = 0;
    for(int i=0; i< _items.length; i++){
      if(_items[i].name.toLowerCase() == item.name.toLowerCase() && _items[i].mark.toLowerCase() == item.mark.toLowerCase()){
        exist = true;
        index = i;
        break;
      }
    }
    if (exist){
      _items[index].quantity = (int.parse(_items[index].quantity) + int.parse(item.quantity)).toString();
    }
    return exist;
  }

  @override
  void increseQuantity(Item item){
    int index = findIndexById(item.name);
    _items[index].quantity = (int.parse(item.quantity) + 1 ).toString();
  }

  int findIndexById(String name) {
    return _items.indexWhere((item) => item.name == name);
  }

}
