import 'package:crypto_ap/di/di.dart';
import 'package:crypto_ap/screens/loading_screen.dart';

import 'package:flutter/material.dart';

void main() async {
  await getitinit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
