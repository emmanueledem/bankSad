import 'dart:async';

import 'package:banksync/app/app.dart';
import 'package:banksync/app/view/widgets/input_field.dart';
import 'package:banksync/core/constants/env.dart';
import 'package:banksync/core/utils/utils.dart';
import 'package:banksync/features/gateways/paystack/presentation/bloc/paystack_payment_bloc.dart';
import 'package:banksync/features/gateways/paystack/presentation/bloc/paystack_payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';

class PaystackUserDetails extends StatefulWidget {
  const PaystackUserDetails({super.key});

  @override
  State<PaystackUserDetails> createState() => _PaystackUserDetailsState();
}

class _PaystackUserDetailsState extends State<PaystackUserDetails> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _amountController = TextEditingController();

  final _userNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _amountFocusNode = FocusNode();

  late StreamController<String> _userNameStreamConroller;
  late StreamController<String> _emailStreamConroller;
  late StreamController<String> _amountStreamConroller;

  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);
  final plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();

    plugin.initialize(
        publicKey: dotenv.env[EnvConstants.testSecretpublicKey].toString());

    _userNameStreamConroller = StreamController<String>.broadcast();
    _emailStreamConroller = StreamController<String>.broadcast();
    _amountStreamConroller = StreamController<String>.broadcast();

    void validateInputs() {
      var canSumit = true;

      final userNameError = CustomFormValidation.errorMessageUserName(
        _userNameController.text.trim(),
        'Username is required',
      );
      final emailError = CustomFormValidation.errorEmailMessage(
        _emailController.text.trim(),
        'Email is required',
      );
      final amountError = CustomFormValidation.errorMessagePassword(
        _amountController.text.trim(),
        'Phone is required',
      );

      if (userNameError != '' || emailError != '' || amountError != '') {
        canSumit = false;
      }

      _canSubmit.value = canSumit;
    }

    _userNameController.addListener(() {
      _userNameStreamConroller.sink.add(_userNameController.text.trim());
      validateInputs();
    });

    _emailController.addListener(() {
      _emailStreamConroller.sink.add(_emailController.text.trim());
      validateInputs();
    });

    _amountController.addListener(() {
      _amountStreamConroller.sink.add(_amountController.text.trim());
      validateInputs();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.clear();
    _emailController.clear();
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: const SecondaryAppbar(title: 'Paystack Payment'),
      body: BlocConsumer<PaystackPaymentBloc, PaystackPaymentState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (message) {
              Logger().d(message);
            },
            success: (message) {
              Navigator.pop(context);
            },
          );
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 34,
                ),
                child: Column(
                  children: [
                    const Gap(24.53),
                    StreamBuilder<String>(
                      stream: _userNameStreamConroller.stream,
                      builder: (context, snapshot) {
                        return InputField(
                          controller: _userNameController,
                          placeholder: 'Username',
                          validationMessage:
                              CustomFormValidation.errorMessageUserName(
                            snapshot.data,
                            'Username is required*',
                          ),
                          validationColor: CustomFormValidation.getColor(
                            snapshot.data,
                            _userNameFocusNode,
                            CustomFormValidation.errorMessageUserName(
                              snapshot.data,
                              'Username is required*',
                            ),
                          ),
                        );
                      },
                    ),
                    const Gap(14),
                    StreamBuilder<String>(
                      stream: _emailStreamConroller.stream,
                      builder: (context, snapshot) {
                        return InputField(
                          controller: _emailController,
                          placeholder: 'Email',
                          validationMessage:
                              CustomFormValidation.errorEmailMessage(
                            snapshot.data,
                            'Email is required*',
                          ),
                          validationColor: CustomFormValidation.getColor(
                            snapshot.data,
                            _emailFocusNode,
                            CustomFormValidation.errorEmailMessage(
                              snapshot.data,
                              'Email is required*',
                            ),
                          ),
                        );
                      },
                    ),
                    const Gap(14),
                    StreamBuilder<String>(
                      stream: _amountStreamConroller.stream,
                      builder: (context, snapshot) {
                        return InputField(
                          controller: _amountController,
                          textInputType: TextInputType.number,
                          placeholder: 'Amount',
                          validationMessage: CustomFormValidation.errorMessage(
                            snapshot.data,
                            'Amount is required*',
                          ),
                          validationColor: CustomFormValidation.getColor(
                            snapshot.data,
                            _amountFocusNode,
                            CustomFormValidation.errorMessage(
                              snapshot.data,
                              'Amount is required*',
                            ),
                          ),
                        );
                      },
                    ),
                    const Gap(33),
                    ValueListenableBuilder(
                      valueListenable: _canSubmit,
                      builder: (context, canSubmit, child) {
                        return BusyButton(
                            title: 'PAY NOW',
                            deactivate: canSubmit == false ||
                                state.maybeWhen(
                                  orElse: () => false,
                                  loading: () => true,
                                ),
                            loading: state.maybeWhen(
                              orElse: () => false,
                              loading: () => true,
                            ),
                            onpress: () async {
                              await context
                                  .read<PaystackPaymentBloc>()
                                  .payNowWithPaystack(
                                      context: context,
                                      username: _userNameController.text.trim(),
                                      email: _emailController.text.trim(),
                                      amount: _amountController.text.trim());
                            });
                      },
                    ),
                    const Gap(33),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
