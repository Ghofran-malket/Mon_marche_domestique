import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/auth/data/repository/auth_repository_impl.dart';
import 'package:mon_marche_domestique/features/auth/domain/entities/user_entity.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/log_out.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/sign_in.dart';
import 'package:mon_marche_domestique/features/auth/domain/use_cases/sign_up.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_event.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUp signUp;
  final SignIn signIn;
  final LogOut logOut;

  AuthBloc({required this.signUp, required this.signIn, required this.logOut}) : super(AuthInitialState()) {

    on<AuthStateChangeEvent>((event, emit) async{
      try{
        await for (var user in AuthRepositoryImpl().authStateChanges) {
          if (user != null) {
            emit(AuthSuccess(user:UserEntity(displayName: user.displayName ?? '', email: user.email!, uid: user.uid))); // User is authenticated
          } else {
            emit(LogedOut()); // User is not authenticated
          }
        }
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
    
    on<LogOutEvent>((event, emit) async{
      emit(LogedOut());
      await logOut();
    });

  }
}
