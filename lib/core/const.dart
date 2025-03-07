import 'package:flutter_dotenv/flutter_dotenv.dart';

String stripePublishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? "";
String stripeSecretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? "";
final String androidApiKey = dotenv.env['ANDROID_API_KEY'] ?? "default-api-key";
final String webApiKey = dotenv.env['WEP_API_KEY'] ?? "";
final String iosApiKey = dotenv.env['IOS_API_KEY'] ?? "";