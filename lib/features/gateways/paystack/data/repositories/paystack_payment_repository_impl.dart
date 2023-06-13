import 'package:banksync/core/constants/errors/failure.dart';
import 'package:banksync/features/gateways/paystack/data/data/datasources.dart';
import 'package:banksync/features/gateways/paystack/domain/repository/respositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: PaystackPaymentRepository)
class PayWithPayStackImpl implements PaystackPaymentRepository {
  final PaystackPaymentRemoteDataSource paystackPaymentRemoteDataSource;

  PayWithPayStackImpl(this.paystackPaymentRemoteDataSource);

  @override
  Future<Either<Failure, String>> paystackPayment(
      {required String username,
      required PaystackPlugin paystackinit,
      required String email,
      required dynamic amount,
      required BuildContext context}) async {
    try {
      final result = await paystackPaymentRemoteDataSource.makePayStackPayment(
          username: username,
          paystackinit: paystackinit,
          email: email,
          amount: amount,
          context: context);
      return Right(result);
    } catch (e) {
      Logger().d(e.toString());
      if (e is NoInternetFailure) {
        return Left(NoInternetFailure());
      }

      return const Left(ServerFailure(
        message: 'Server error, please try again',
      ));
    }
  }
}
