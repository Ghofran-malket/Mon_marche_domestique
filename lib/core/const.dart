import 'package:flutter_dotenv/flutter_dotenv.dart';

String stripePublishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? "";
String stripeSecretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? "";
final String apiKey = dotenv.env['API_KEY'] ?? "default-api-key";