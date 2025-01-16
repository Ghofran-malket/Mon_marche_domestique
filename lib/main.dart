// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:mon_marche_domestique/features/auth/data/repository/auth_repository_impl.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/check_user_state.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/sign_up.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mon_marche_domestique/features/auth/presentation/pages/sign_in_page.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/items/data/repository/item_repositoy_impl.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/add_item.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/decrease_quantity.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/get_items.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/increase_quantity.dart';
import 'package:mon_marche_domestique/features/items/presentations/bloc/item_bloc.dart';
import 'package:mon_marche_domestique/features/items/presentations/pages/add_item_page.dart';
import 'package:mon_marche_domestique/features/items/presentations/pages/items_list_page.dart';

void main() async {
  final itemRepository = ItemRepositoryImpl();
  final authRepo = AuthRepositoryImpl();
  final getItems = GetItems(itemRepository);
  final addItem = AddItem(itemRepository);
  final increaseQuantity = IncreaseItemsQuantity(itemRepository);
  final decreaseQuantity = DecreaseItemsQuantity(itemRepository);
  final checkUserState = CheckUserState(authRepo);
  final signUp = SignUp(authRepo);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    getItems: getItems,
    addItem: addItem,
    increaseQuantity: increaseQuantity,
    decreaseItemsQuantity : decreaseQuantity,
    checkUserState : checkUserState,
    signUp : signUp
  ));
}

class MyApp extends StatelessWidget {
  final GetItems getItems;
  final AddItem addItem;
  final IncreaseItemsQuantity increaseQuantity;
  final DecreaseItemsQuantity decreaseItemsQuantity;
  final CheckUserState checkUserState;
  final SignUp signUp;
  MyApp({required this.getItems, required this.addItem, required this.increaseQuantity, 
  required this.decreaseItemsQuantity, required this.checkUserState, required this.signUp});



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ItemBloc(getItems: getItems, addItem: addItem, increaseItemsQuantity: increaseQuantity,
         decreaseItemsQuantity: decreaseItemsQuantity,),
        child: BlocProvider(
          create: (context) => AuthBloc(checkUserState: checkUserState, signUp: signUp),
          child: MaterialApp(
            title: 'Flutter Clean Architecture',
            debugShowCheckedModeBanner: false,
            home: SignInPage(),
            routes: {
              '/add': (context) => AddItemPage(),
            },
          ),
        ));
  }
}
