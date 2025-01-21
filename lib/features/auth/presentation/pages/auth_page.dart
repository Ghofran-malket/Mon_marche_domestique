import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_event.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_state.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custom_pimary_button.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custom_text_field.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custome_appbar.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isSignUp = false;

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: CustomeAppBar(
          title: _isSignUp ? 'Register' : 'Sign In',
          icon: Icons.arrow_back_ios,   
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: _isSignUp ? Text("Sign up success ${state.user.uid} ") 
                : Text("Sign In success ${state.user.uid}")));
              setState(() {
                _isSignUp = !_isSignUp;// Toggle between Sign In and Sign Up
              });
            }
            if (state is AuthFailure){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage),backgroundColor: Colors.red[600],));
            }
            emailController.clear();
            passwordController.clear();
          },
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    CustomTextField(controller: emailController, labelText: 'email'),
                    CustomTextField(controller: passwordController, labelText: 'password'),
                    // CustomPrimaryButton(
                    //   label:"Check",
                    //   onPressed: (){
                    //     context.read<AuthBloc>().add(AuthStateChangeEvent());
                    //   }
                    // ),
                    CustomPrimaryButton(
                      label: _isSignUp ? "Sign up" : "Sign In",
                      onPressed: (){
                        context.read<AuthBloc>().add(
                          _isSignUp ? SignUpEvent(email: emailController.text, password: passwordController.text):
                          SignInEvent(email: emailController.text, password: passwordController.text)
                        );
                      }
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isSignUp = !_isSignUp; // Toggle between Sign In and Sign Up
                        });
                      },
                      child: Text(_isSignUp
                          ? 'Already have an account? Sign In'
                          : 'Don\'t have an account? Sign Up'),
                    ),
                  
                  ],
                ),
              ),
            );
          }
        ),
    );
  }
}
