import 'dart:io';
import 'package:banksync/core/constants/env.dart';
import 'package:banksync/core/constants/errors/error.dart';
import 'package:banksync/core/core.dart';
import 'package:banksync/core/network/network_info.dart';
import 'package:banksync/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class PaystackPaymentRemoteDataSource {
  Future<String> makePayStackPayment(
      {required String username,
      required String email,
      required String amount,
      required BuildContext context});
}

@LazySingleton(as: PaystackPaymentRemoteDataSource)
class PaystackPaymentRemoteDataSourceImpl
    implements PaystackPaymentRemoteDataSource {
  PaystackPaymentRemoteDataSourceImpl(
    this.networkInfo,
  );

  final NetworkInfo networkInfo;
  final PaystackPlugin paystack = PaystackPlugin();

  @override
  Future<String> makePayStackPayment(
      {required String username,
      required String email,
      required String amount,
      required BuildContext context}) async {
    if (await networkInfo.isConnected) {
      String finalAmount = StringFormat().formatAmount(amount);

      initializePlugin().then((value) async {
        Charge charge = Charge()
          ..amount = 1000 * 100
          // ..amount = '$amount+.00' * 100 as int
          ..email = email
          ..reference = _getReference()
          ..card = getCardUi();
        CheckoutResponse response = await paystack.checkout(
          context,
          charge: charge,
          method: CheckoutMethod.card,
          fullscreen: false,
          logo: Image.asset(AppAssets.banksadLogo),
        );

        if (response == true) {
          Logger().d('Transaction successful');
        } else {
          Logger().d('Transaction failed');
        }
      });
      // Logger().d(username);
      // Logger().d(email);
      // Logger().d(amount);
      // String fff = StringFormat().formatAmount(amount);
      // Logger().d('$fff.00');
      return 'paid';
    } else {
      throw NoInternetException();
    }
  }

  // initialize plugin
  Future initializePlugin() async {
    paystack.initialize(
        publicKey: dotenv.env[EnvConstants.testSecretpublicKey].toString());
  }

// get reference
  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard getCardUi() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }
}
