import 'package:crypto_ap/screens/welcome_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomScreen(),
        ),
      );
    });
  }

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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 150),
              child: Text(
                'CoinCap',
                style: TextStyle(
                  fontSize: 60,
                  fontFamily: 'Yti',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SpinKitWaveSpinner(
              size: 100,
              color: Color(0xff00203F),
              trackColor: Color(0xffADEFD1),
              waveColor: Color(0xffADEFD1),
            ),
          ],
        ),
      ),
    );
  }
}
