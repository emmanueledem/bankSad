// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:banksync/features/gateways/paystack/presentation/bloc/paystack_payment_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../domain/domain.dart';

class PaystackPaymentBloc extends Cubit<PaystackPaymentState> {
  PaystackPaymentBloc({
    required this.paystackPaymentUsecase,
  }) : super(const PaystackPaymentState.initial());

  final PaystackPaymentUsecase paystackPaymentUsecase;

  Future<void> payNowWithPaystack({
    required BuildContext context,
    required String username,
    required String email,
    required dynamic amount,
  }) async {
    emit(const PaystackPaymentState.loading());
    final result = await paystackPaymentUsecase(PaystackPaymentUsecaseParams(
        userName: username, email: email, amount: amount, context: context));
    emit(
      await result.fold(
        (failure) => PaystackPaymentState.error(
          failure.toString(),
        ),
        (success) => PaystackPaymentState.success(
          message: success,
        ),
      ),
    );
  }
}
