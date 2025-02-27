abstract class PaymentState {}

class PaymentLoadingState extends PaymentState{}

class PaymentSuccessState extends PaymentState{}

class PaymentErrorState extends PaymentState{
  final String error;
  PaymentErrorState({required this.error});
}