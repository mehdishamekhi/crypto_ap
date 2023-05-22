import 'package:crypto_ap/data/datasource/crypto_list_datasource.dart';
import 'package:crypto_ap/data/repository/crypto_list_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> getitinit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'api.coincap.io/v2/'),
    ),
  );
  //datasource
  locator
      .registerSingleton<ICryptoListDatasource>(ICryptoListRemoteDatasource());
  //repository
  locator.registerSingleton<ICryptoListRepository>(CryptoListRepository());
}
