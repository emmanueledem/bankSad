import 'package:banksync/core/constants/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class PaystackPaymentRepository {
  Future<Either<Failure, String>> paystackPayment(
      {required String username,
      required String email,
      required dynamic amount,
      required BuildContext context});
}
