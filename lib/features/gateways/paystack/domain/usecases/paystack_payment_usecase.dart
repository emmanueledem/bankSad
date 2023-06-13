import 'package:banksync/core/constants/errors/failure.dart';
import 'package:banksync/core/constants/usecase.dart';
import 'package:banksync/features/gateways/paystack/domain/repository/respositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PaystackPaymentUsecase
    implements UseCase<String, PaystackPaymentUsecaseParams> {
  PaystackPaymentUsecase(this.paystackPaymentRepository);
  final PaystackPaymentRepository paystackPaymentRepository;

  @override
  Future<Either<Failure, String>> call(PaystackPaymentUsecaseParams params) {
    return paystackPaymentRepository.paystackPayment(
        username: params.userName,
        paystackinit: params.paystackinit,
        email: params.email,
        amount: params.amount,
        context: params.context);
  }
}

class PaystackPaymentUsecaseParams extends Equatable {
  const PaystackPaymentUsecaseParams(
      {required this.userName,
      required this.email,
      required this.paystackinit,
      required this.amount,
      required this.context});

  final String userName;
  final String email;
  final PaystackPlugin paystackinit;
  final dynamic amount;
  final BuildContext context;

  @override
  List<Object?> get props => [userName, email, amount, context];
}
