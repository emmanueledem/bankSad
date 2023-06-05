import 'package:banksync/bootstrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: '.env.development');
  // await configureDependencies();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    await bootstrap(() => const MyApp());
  });
}
