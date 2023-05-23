import 'package:crypto_ap/data/model/crypto_model.dart';
import 'package:crypto_ap/di/di.dart';
import 'package:crypto_ap/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class ICryptoListDatasource {
  Future<List<CryptoModel>> getcryptolist();
}

class ICryptoListRemoteDatasource extends ICryptoListDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<CryptoModel>> getcryptolist() async {
    try {
      var datasource = await _dio.get('');
      return datasource.data['data']
          .map<CryptoModel>((jsonobject) => CryptoModel.fromMapJson(jsonobject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response!.statusCode, ex.response!.statusMessage);
    } catch (ex) {
      throw ApiException(0, 'datasource eror');
    }
  }
}
