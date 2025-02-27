import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/payment/presentations/bloc/payment_bloc.dart';
import 'package:mon_marche_domestique/features/payment/presentations/bloc/payment_event.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Center(
              child: MaterialButton(
                color: Colors.indigo,
                onPressed: ()=> context.read<PaymentBloc>().add(MakePaymentEvent()),
                child: Text('pay')
              ),
            )
          ],
        ),
      
    );
  }
}