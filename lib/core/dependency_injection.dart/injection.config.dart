// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../../features/gateways/paystack/data/data/datasources.dart' as _i9;
import '../../features/gateways/paystack/data/data/paystack_payment_remote_data_source.dart'
    as _i6;
import '../../features/gateways/paystack/data/repositories/paystack_payment_repository_impl.dart'
    as _i8;
import '../../features/gateways/paystack/domain/repository/respositories.dart'
    as _i7;
import '../../features/gateways/paystack/domain/usecases/paystack_payment_usecase.dart'
    as _i10;
import '../network/network_info.dart' as _i5;
import 'register_module.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio);
  gh.factory<_i4.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  gh.lazySingleton<_i6.PaystackPaymentRemoteDataSource>(
      () => _i6.PaystackPaymentRemoteDataSourceImpl(get<_i5.NetworkInfo>()));
  gh.lazySingleton<_i7.PaystackPaymentRepository>(() =>
      _i8.PayWithPayStackImpl(get<_i9.PaystackPaymentRemoteDataSource>()));
  gh.lazySingleton<_i10.PaystackPaymentUsecase>(
      () => _i10.PaystackPaymentUsecase(get<_i7.PaystackPaymentRepository>()));
  return get;
}

class _$RegisterModule extends _i11.RegisterModule {}
