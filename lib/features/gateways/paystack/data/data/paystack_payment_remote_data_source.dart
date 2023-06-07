import 'package:banksync/core/constants/errors/error.dart';
import 'package:banksync/core/network/network_info.dart';
import 'package:flutter/material.dart';
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
  PaystackPaymentRemoteDataSourceImpl(this.networkInfo);

  final NetworkInfo networkInfo;

  @override
  Future<String> makePayStackPayment(
      {required String username,
      required String email,
      required String amount,
      required BuildContext context}) async {
    if (await networkInfo.isConnected) {
      Logger().d(username);
      Logger().d(email);
      Logger().d(amount);
      return '';
    } else {
      throw NoInternetException();
    }
  }
}
