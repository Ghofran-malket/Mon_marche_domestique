import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_event.dart';
import 'package:mon_marche_domestique/features/auth/presentation/bloc/auth_state.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custom_pimary_button.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custom_text_field.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custome_appbar.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: const CustomeAppBar(
          title: 'Check user state',
          icon: Icons.arrow_back_ios,   
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Center(child: Text("Signed up"));
                  }
                  return Container();
                },
              ),
              CustomTextField(controller: emailController, labelText: 'email'),
              CustomTextField(controller: passwordController, labelText: 'password'),
                CustomPrimaryButton(
                  label:"Check",
                  onPressed: (){
                    context.read<AuthBloc>().add(AuthStateChangeEvent());
                  }
                ),
                CustomPrimaryButton(label: "Sign up", onPressed: (){
                  final email = emailController.text;
                  final password = passwordController.text;
                  
                  context.read<AuthBloc>().add(SignUpEvent(email: email, password: password ));
                   
                })
                
              ],
            ),
          ),
        ),
    );
  }
}
