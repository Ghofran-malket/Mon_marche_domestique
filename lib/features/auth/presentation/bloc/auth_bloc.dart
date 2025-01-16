// lib/presentation/blocs/item_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/check_user_state.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/sign_up.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_event.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckUserState checkUserState;
  final SignUp signUp;

  AuthBloc({required this.checkUserState, required this.signUp}) : super(AuthLoadingState()) {

    on<AuthStateChangeEvent>((event, emit) async{
      try{
        checkUserState();
        emit(AuthStateChangeState());
      }catch(e){
        print("Error");
      }
    });

    on<SignUpEvent>(((event, emit) async{
      try{
        signUp(event.email,event.password);
        emit(AuthSuccess());
      }catch(e){
        print("sign up failed");
      }
    }));

  }
}
