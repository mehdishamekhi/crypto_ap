import 'package:crypto_ap/data/model/crypto_model.dart';
import 'package:crypto_ap/screens/buy_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CoinDetailScreen extends StatefulWidget {
  final CryptoModel cryptoModels;
  const CoinDetailScreen(this.cryptoModels, {super.key});

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.more_vert,
            size: 35,
            color: Color(0xff00203F),
          ),
        ],
        title: Text(
          widget.cryptoModels.name!,
          style: const TextStyle(
            fontSize: 30,
            fontFamily: 'yb',
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffADEFD1),
      ),
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
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: changecolor(
                        double.parse(
                          widget.cryptoModels.changepecent24hr!,
                        ),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.cryptoModels.symbol!,
                        style: const TextStyle(
                          fontSize: 30,
                          fontFamily: 'yb',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    '\$ ${double.parse(widget.cryptoModels.price!).toStringAsFixed(3)}',
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff00203F),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$ ${double.parse(widget.cryptoModels.changepecent24hr!).toStringAsFixed(3)}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: changecolor(
                            double.parse(
                              widget.cryptoModels.changepecent24hr!,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      getarrowdirection(
                        double.parse(
                          widget.cryptoModels.changepecent24hr!,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'supply',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffADEFD1),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            double.parse(widget.cryptoModels.supply!)
                                .toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff00203F),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          const Text(
                            'maxSupply',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffADEFD1),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.cryptoModels.maxsupply == null
                                ? ''
                                : double.parse(
                                    (widget.cryptoModels.maxsupply).toString(),
                                  ).toStringAsFixed(3),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff00203F),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          const Text(
                            'vwap24Hr',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffADEFD1),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            double.parse(widget.cryptoModels.vwap24hr!)
                                .toStringAsFixed(3),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff00203F),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: SizedBox(
                    height: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffADEFD1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        Uri uri = Uri.parse(
                            widget.cryptoModels.explorer ?? 'www.google.com');
                        await launchUrl(uri);
                      },
                      child: Text(
                        'More information: \n\n ${widget.cryptoModels.explorer!}',
                        style: const TextStyle(
                          color: Color(0xff00203F),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffADEFD1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BuyScreen(widget.cryptoModels),
                          ),
                        );
                      },
                      child: Text(
                        'Buy ${widget.cryptoModels.name}',
                        style: const TextStyle(
                          color: Color(0xff00203F),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
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
      size: 50,
    );
  } else {
    return const Icon(
      Icons.trending_down,
      color: Colors.red,
      size: 50,
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

Future<void> _launchUrl(Uri uri) async {
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $uri');
  }
}
