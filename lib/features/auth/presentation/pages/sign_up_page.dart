import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_event.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_state.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custom_pimary_button.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custom_text_field.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custome_appbar.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: const CustomeAppBar(
          title: 'Register',
          icon: Icons.arrow_back_ios,   
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
              CustomTextField(controller: emailController, labelText: 'email'),
              CustomTextField(controller: passwordController, labelText: 'password'),
              CustomPrimaryButton(label:"Check",
                onPressed: (){
                  context.read<AuthBloc>().add(AuthStateChangeEvent());
                }
              ),

              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Sign up success")));
                  }
                  if (state is AuthFailure){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage),backgroundColor: Colors.red[600],));
                      emailController.clear();
                      passwordController.clear();
                  }
                },
                child: CustomPrimaryButton(
                  label: "Sign up",
                  onPressed: (){
                    context.read<AuthBloc>().add(SignUpEvent(email: emailController.text, password: passwordController.text ));
                  })
              ), 
              ],
            ),
          ),
        ),
    );
  }
}
