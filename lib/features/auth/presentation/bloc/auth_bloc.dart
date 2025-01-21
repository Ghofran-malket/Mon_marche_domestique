// lib/presentation/blocs/item_bloc.dart
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/check_user_state.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/sign_in.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/sign_up.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_event.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckUserState checkUserState;
  final SignUp signUp;
  final SignIn signIn;

  AuthBloc({required this.checkUserState, required this.signUp, required this.signIn}) : super(AuthInitialState()) {

    on<AuthStateChangeEvent>((event, emit) async{
      try{
        checkUserState();
        emit(AuthStateChangeState());
      }catch(e){
        print("Error");
      }
    });

    on<SignUpEvent>(((event, emit) async{
      emit(AuthLoadingState());
      final result = await  signUp(event.email,event.password);

      result.fold(
        (errorMessage) => emit(AuthFailure(errorMessage)),// In case of error
        (user) => emit(AuthSuccess(user: user))
      );
      
    }));

    on<SignInEvent>(((event, emit) async{
      emit(AuthLoadingState());
      final result = await  signIn(event.email,event.password);

      result.fold(
        (errorMessage) => emit(AuthFailure(errorMessage)),// In case of error
        (user) => emit(AuthSuccess(user: user))
      );
      
    }));

  }
}
