import 'package:crypto_ap/bloc/cryptolist/cryptolist_bloc.dart';
import 'package:crypto_ap/bloc/cryptolist/cryptolist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CoinListScreen extends StatefulWidget {
  const CoinListScreen({super.key});

  @override
  State<CoinListScreen> createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffADEFD1),
                Color(0xff00203F),
              ],
            ),
          ),
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            builder: (context, state) {
              if (state is CryptoListLoadingState) {
                return SpinKitChasingDots();
              } else {
                return SafeArea(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffADEFD1),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        height: 100,
                        child: const ListTile(),
                      );
                    },
                  ),
                );
              }
            },
          )),
    );
  }
}
