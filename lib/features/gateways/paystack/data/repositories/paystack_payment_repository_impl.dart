import 'package:banksync/core/constants/errors/error.dart';
import 'package:banksync/core/constants/errors/failure.dart';
import 'package:banksync/features/gateways/paystack/data/data/datasources.dart';
import 'package:banksync/features/gateways/paystack/domain/repository/respositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: PaystackPaymentRepository)
class PayWithPayStackImpl implements PaystackPaymentRepository {
  final PaystackPaymentRemoteDataSource paystackPaymentRemoteDataSource;

  PayWithPayStackImpl(this.paystackPaymentRemoteDataSource);

  @override
  Future<Either<Failure, String>> paystackPayment(
      {required String username,
      required String email,
      required String amount,
      required BuildContext context}) async {
    try {
      final result = paystackPaymentRemoteDataSource.makePayStackPayment(
          username: username, email: email, amount: amount, context: context);
      return Right(result.toString());
    } catch (e) {
      Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }

      return const Left(ServerFailure(
        message: 'Server error, please try again',
      ));
    }
  }
}
