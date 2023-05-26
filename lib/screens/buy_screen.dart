import 'package:crypto_ap/data/model/crypto_model.dart';
import 'package:flutter/material.dart';

class BuyScreen extends StatefulWidget {
  final CryptoModel cryptoModellist;
  const BuyScreen(this.cryptoModellist, {super.key});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
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
          widget.cryptoModellist.name!,
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
        child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center()),
      ),
    );
  }
}
