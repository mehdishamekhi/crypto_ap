import 'package:crypto_ap/screens/onboarding_screen.dart';

import 'package:flutter/material.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 67, 241, 244),
                Color(0xff00203F),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                width: 350,
                child: Image.asset(
                  'assets/images/instagram_profile_image.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                'Welcome to CoinCap - Where Crypto Meets Possibility! Join our vibrant community of crypto enthusiasts. Buy, sell, and trade effortlessly. Stay updated with real-time market data. Explore advanced features and engage with fellow enthusiasts. Your crypto journey starts here. Welcome to the revolution. CoinCap Team.',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'yb',
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'please turn on your VPN to open app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'yb',
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
