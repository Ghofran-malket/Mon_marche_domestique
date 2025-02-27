// lib/presentation/blocs/item_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_marche_domestique/features/payment/domain/use_cases/payment_usecase.dart';
import 'package:mon_marche_domestique/features/payment/presentations/bloc/payment_event.dart';
import 'package:mon_marche_domestique/features/payment/presentations/bloc/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {

  PaymentBloc() : super(PaymentLoadingState()) {
    on<MakePaymentEvent>((event, emit) async {
      emit(PaymentLoadingState());

      try {
        await PaymentUseCase().call();
        
        emit(PaymentSuccessState());
      } catch (e) {
        // On error, yield the ItemErrorState with an error message
        emit(PaymentErrorState(error: 'Failed to pay: $e'));
      }
    });
  }
}
