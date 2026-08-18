import 'dart:io';
import 'package:eshop/app/custom_bloc_observer.dart';
import 'package:eshop/core/firebase/firebase_helper.dart';
import 'package:eshop/core/injection/service_locater.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
Future<void> runbefore() async {
  if (Platform.isAndroid) {
    await Firebase.initializeApp();
    sl<FirebaseHelper>().setupfcm();
  }
  if (Platform.isAndroid) {
    try {
      await dotenv.load(fileName: ".env");
    } catch (e) {
      throw Exception("Stg went wrng");
    }
    Stripe.publishableKey =
        dotenv.env["STRIPE_PUBLISHABLE_KEY"] ?? "stg went wrng";
    await Stripe.instance.applySettings();
  }
  Bloc.observer = CustomBlocObserver();
}