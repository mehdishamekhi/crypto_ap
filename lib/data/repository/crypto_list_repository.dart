import 'package:crypto_ap/data/datasource/crypto_list_datasource.dart';
import 'package:crypto_ap/data/model/crypto_model.dart';
import 'package:crypto_ap/di/di.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ICryptoListRepository {
  Future<Either<String, List<CryptoModel>>> cryptolist();
}

class CryptoListRepository extends ICryptoListRepository {
  final ICryptoListDatasource datasource = locator.get();
  @override
  Future<Either<String, List<CryptoModel>>> cryptolist() async {
    try {
      var repository = await datasource.getcryptolist();
      return right(repository);
    } on DioError catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
