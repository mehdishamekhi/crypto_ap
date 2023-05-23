import 'package:crypto_ap/bloc/cryptolist/cryptolist_bloc.dart';
import 'package:crypto_ap/bloc/cryptolist/cryptolist_event.dart';
import 'package:crypto_ap/bloc/cryptolist/cryptolist_state.dart';
import 'package:crypto_ap/screens/coin_detail_screen.dart';
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
  void initState() {
    super.initState();
    BlocProvider.of<CryptoListBloc>(context).add(GetCryptoListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'rank',
              style: TextStyle(
                fontFamily: 'yli',
                fontSize: 30,
                color: Color(0xff00203F),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 150),
              child: Text(
                'name\nsymbol',
                style: TextStyle(
                  fontFamily: 'yli',
                  fontSize: 20,
                  color: Color(0xff00203F),
                ),
              ),
            ),
            Text(
              'price\npicechange',
              style: TextStyle(
                fontFamily: 'yli',
                fontSize: 20,
                color: Color(0xff00203F),
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 169, 214, 233),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 169, 214, 233),
              Color(0xff00203F),
            ],
          ),
        ),
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          builder: (context, state) {
            if (state is CryptoListLoadingState) {
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                  strokeWidth: 5,
                ),
              );
            } else {
              if (state is CryptoListSuccessState) {
                return state.cryptolists.fold(
                  (l) {
                    return Text(l);
                  },
                  (cryptolist) {
                    return SafeArea(
                      child: RefreshIndicator(
                        onRefresh: () async {},
                        child: ListView.builder(
                          itemCount: cryptolist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: changecolor(
                                    double.parse(
                                      cryptolist[index].changepecent24hr!,
                                    ),
                                  ),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              ),
                              height: 100,
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CoinDetailScreen(),
                                    ),
                                  );
                                },
                                isThreeLine: true,
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cryptolist[index].name!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'yb',
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${double.parse(cryptolist[index].price!).toStringAsFixed(3)} \$',
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          double.parse(cryptolist[index]
                                                  .changepecent24hr!)
                                              .toStringAsFixed(3),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: changecolor(
                                              double.parse(
                                                cryptolist[index]
                                                    .changepecent24hr!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                subtitle: Text(
                                  cryptolist[index].symbol!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'yb',
                                  ),
                                ),
                                leading: Text(
                                  cryptolist[index].rank!,
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                trailing: getarrowdirection(
                                  double.parse(
                                      cryptolist[index].changepecent24hr!),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              }
            }
            return const Center(
              child: SpinKitWaveSpinner(
                size: 100,
                color: Color(0xff00203F),
                trackColor: Color(0xffADEFD1),
                waveColor: Color(0xffADEFD1),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget getarrowdirection(double changepercent) {
  if (changepercent > 0) {
    return const Icon(
      Icons.trending_up,
      color: Colors.green,
    );
  } else {
    return const Icon(
      Icons.trending_down,
      color: Colors.red,
    );
  }
}

Color changecolor(double changepercent) {
  if (changepercent > 0) {
    return Colors.green;
  } else {
    return Colors.red;
  }
}
