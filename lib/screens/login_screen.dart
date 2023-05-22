import 'package:crypto_ap/bloc/cryptolist/cryptolist_bloc.dart';
import 'package:crypto_ap/screens/coin_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailcontroller.addListener(() {
      setState(() {});
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: ListView(
            children: [
              const Text(
                'Log in ',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontFamily: 'yb',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'yb',
                  ),
                ),
              ),
              TextField(
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: emailcontroller.text.isEmpty
                      ? const SizedBox(
                          width: 0,
                          height: 0,
                        )
                      : IconButton(
                          onPressed: () {
                            emailcontroller.clear();
                          },
                          icon: const Icon(Icons.close),
                        ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff00203F),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  hintText: 'Your Email address',
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 80, 134, 178),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'continue with email',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'ylt',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'or',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'yli',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(
                          Icons.apple,
                          size: 30,
                        ),
                      ),
                      Text(
                        'continue with apple',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'ylt',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              'assets/images/google.png',
                            ),
                          ),
                        ),
                        const Text(
                          'continue with google',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'ylt',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            'assets/images/facebook.png',
                          ),
                        ),
                      ),
                      const Text(
                        'continue with facebook',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'ylt',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'you want open without login ?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'yb',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InkWell(
                      onTap: () {
                        BlocProvider(
                          create: (context) => CryptoListBloc(),
                          child: const CoinListScreen(),
                        );
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontFamily: 'yb',
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
