import 'package:mon_marche_domestique/features/payment/data/repository/payment_repository_impl.dart';
import 'package:mon_marche_domestique/features/payment/domain/repository/payment_repository.dart';

class PaymentUseCase {
  final PaymentRepository repository = PaymentRepositoryImpl();

  Future<String> call() async {
    try {
      await repository.makePayment(); 
      return "success";
    }catch (e) {
      print(e);
      return "failed";
    }
  }
}
