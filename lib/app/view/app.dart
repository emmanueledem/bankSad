import 'package:banksync/core/core.dart';
import 'package:banksync/core/dependency_injection.dart/injection.dart';
import 'package:banksync/features/features.dart';
import 'package:banksync/features/gateways/paystack/presentation/bloc/paystack_payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PaystackPaymentBloc(
              paystackPaymentUsecase: sl<PaystackPaymentUsecase>()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return const MaterialApp(
            onGenerateRoute: generateRoute,
            debugShowCheckedModeBanner: false,
            initialRoute: RouteName.splash,
          );
        },
      ),
    );
  }
}
