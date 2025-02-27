import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mon_marche_domestique/core/const.dart';
import 'package:mon_marche_domestique/features/payment/domain/repository/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  @override
  Future<void> makePayment() async{
    try{
      final paymentIntentClientSecret = await _createPaymentIntent(10, "usd");
      if (paymentIntentClientSecret == null )return;
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "Ghofran Malkat"
      ));

      await _processPayement();
    }catch(e){
      print(e);
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async{
    try{
      final Dio dio = Dio();
      Map<String,String> data = {
        "amount": (amount*100).toString(),
        "currency": currency
      };
      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents", 
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": "application/x-www-from-urlencoded"
          }
        )
      );
      if(response.data != null){
        print( response.data);
        return response.data["client_secret"];
      }
      return null;
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<void> _processPayement() async{
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      print (e);
    }  
  }

}
