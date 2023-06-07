import 'package:freezed_annotation/freezed_annotation.dart';

part 'paystack_payment_state.freezed.dart';

@freezed
class PaystackPaymentState with _$PaystackPaymentState {
  const factory PaystackPaymentState.initial() = _$Initial;
  const factory PaystackPaymentState.loading() = _$Loading;
  const factory PaystackPaymentState.error(String message) = _$Error;
  const factory PaystackPaymentState.success({
    required String message,
  }) = _$Success;
}
