// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mon_marche_domestique/core/const.dart';
import 'package:mon_marche_domestique/features/auth/data/repository/auth_repository_impl.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/google_sign_in.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/log_out.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/sign_in.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/sign_up.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_event.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_state.dart';
import 'package:mon_marche_domestique/features/auth/presentation/pages/auth_page.dart';
import 'package:mon_marche_domestique/features/categories/data/repository/category_repository_impl.dart';
import 'package:mon_marche_domestique/features/categories/domain/use_cases/get_categories.dart';
import 'package:mon_marche_domestique/features/categories/presentations/bloc/category_bloc.dart';
import 'package:mon_marche_domestique/features/items/domain/use_cases/upload_json_file.dart';
import 'package:mon_marche_domestique/features/items/presentations/pages/items_list_page.dart';
import 'package:mon_marche_domestique/features/payment/presentations/bloc/payment_bloc.dart';
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

void main() async {
  await dotenv.load(fileName: '.env'); 
  await _setUp();
  runApp(MyApp());
}

Future<void> _setUp() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemBloc(
              getItems: GetItems(ItemRepositoryImpl()),
              addItem: AddItem(ItemRepositoryImpl()),
              increaseItemsQuantity:
                  IncreaseItemsQuantity(ItemRepositoryImpl()),
              decreaseItemsQuantity:
                  DecreaseItemsQuantity(ItemRepositoryImpl()),
              uploadFile: UploadJsonFile(ItemRepositoryImpl())),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
              signUp: SignUp(AuthRepositoryImpl()),
              signIn: SignIn(AuthRepositoryImpl()),
              logOut: LogOut(AuthRepositoryImpl()),
              googleSignIn: GoogleSignIn(AuthRepositoryImpl()))
            ..add(AuthStateChangeEvent()),
        ),
        BlocProvider(create: (context) => PaymentBloc()),
        BlocProvider(
          create: (context) => CategoryBloc(
              getCategories: GetCategories(CategoryRepositoryImpl())),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Clean Architecture',
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return ItemListPage();
            } else if (state is LogedOut) {
              return AuthPage();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        routes: {
          '/add': (context) => AddItemPage(),
        },
      ),
    );
  }
}
