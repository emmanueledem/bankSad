import 'package:banksync/core/core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   // providers: const [],
    //   child: Builder(
    //     builder: (context) {
    return const MaterialApp(
      onGenerateRoute: generateRoute,
      initialRoute: RouteName.splash,
      //     );
      //   },
      // ),
    );
  }
}
