import 'package:crypto_ap/data/model/crypto_model.dart';
import 'package:dartz/dartz.dart';

abstract class CryptoListState {}

class CryptoListInitState extends CryptoListState {}

class CryptoListLoadingState extends CryptoListState {}

class CryptoListSuccessState extends CryptoListState {
  Either<String, List<CryptoModel>> cryptolists;
  CryptoListSuccessState(this.cryptolists);
}
