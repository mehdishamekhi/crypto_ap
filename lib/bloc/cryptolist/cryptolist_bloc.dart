import 'package:bloc/bloc.dart';
import 'package:crypto_ap/bloc/cryptolist/cryptolist_event.dart';
import 'package:crypto_ap/bloc/cryptolist/cryptolist_state.dart';

import 'package:crypto_ap/data/repository/crypto_list_repository.dart';
import 'package:crypto_ap/di/di.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final ICryptoListRepository repository = locator.get();

  CryptoListBloc() : super(CryptoListInitState()) {
    on<GetCryptoListEvent>((event, emit) async {
      emit(CryptoListLoadingState());
      var response = await repository.cryptolist();
      emit(CryptoListSuccessState(response));
    });
  }
}
