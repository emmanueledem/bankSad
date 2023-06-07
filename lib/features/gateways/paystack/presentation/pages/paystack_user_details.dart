import 'dart:async';

import 'package:banksync/app/app.dart';
import 'package:banksync/core/core.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _userNameStreamConroller = StreamController<String>.broadcast();
    _emailStreamConroller = StreamController<String>.broadcast();
    _amountStreamConroller = StreamController<String>.broadcast();

    _userNameController.addListener(() {
      _userNameStreamConroller.sink.add(_userNameController.text.trim());
    });

    _emailController.addListener(() {
      _emailStreamConroller.sink.add(_emailController.text.trim());
    });

    _amountController.addListener(() {
      _amountStreamConroller.sink.add(_amountController.text.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      appBar: SecondaryAppbar(),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
