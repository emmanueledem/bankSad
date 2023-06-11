import 'package:banksync/core/constants/errors/failure.dart';
import 'package:banksync/core/constants/usecase.dart';
import 'package:banksync/features/gateways/paystack/domain/repository/respositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
        email: params.email,
        amount: params.amount,
        context: params.context);
  }
}

class PaystackPaymentUsecaseParams extends Equatable {
  const PaystackPaymentUsecaseParams(
      {required this.userName,
      required this.email,
      required this.amount,
      required this.context});

  final String userName;
  final String email;
  final dynamic amount;
  final BuildContext context;

  @override
  List<Object?> get props => [userName, email, amount, context];
}
