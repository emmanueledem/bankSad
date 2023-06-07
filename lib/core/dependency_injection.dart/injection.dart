import 'package:banksync/core/dependency_injection.dart/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// This is the root of the dependency injection tree.
final sl = GetIt.instance;

@InjectableInit()

/// this is the method to initialize the dependency injection tree.
void configureDependencies() => $initGetIt(sl);
