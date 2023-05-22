import 'package:crypto_ap/screens/login_screen.dart';
import 'package:crypto_ap/widgets/onboarding_widgets.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool getstarted = false;
  PageController controller = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      if (controller.page == 2) {
        setState(() {
          getstarted = false;
        });
      } else {
        setState(() {
          getstarted = true;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> descriptionlist = [
      'Discover the power of our crypto app, designed to simplify your digital asset journey with intuitive features and robust security measures.Explore a seamless platform that allows you to buy, sell, and trade cryptocurrencies effortlessly, backed by real-time market data and insightful analytics.Join our vibrant community of crypto enthusiasts, where you can engage, learn, and exchange ideas, unlocking the full potential of the decentralized world.',
      'Experience advanced portfolio management tools, comprehensive charts, and graphs that empower you to make informed investment decisions and track your crypto assets with precision.Access a range of trading options, including limit orders and advanced order types, to take advantage of market opportunities and enhance your trading strategiesStay updated with personalized alerts and notifications, ensuring you never miss crucial market movements or important updates relevant to your investments',
      'Your security is our top priority. Benefit from industry-leading encryption and multi-factor authentication to safeguard your funds and personal information.√Trust in our compliance with regulatory standards, ensuring a safe and compliant environment for your crypto transactions and investments.',
    ];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffD6ED17),
              Color(0xff606060),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: descriptionlist.length,
                controller: controller,
                itemBuilder: (context, index) => OnboardingWidget(
                  imageurl: 'assets/images/$index.jpg',
                  description: descriptionlist[index],
                  screenheight: height,
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ExpandingDotsEffect(
                dotWidth: 15,
                dotHeight: 12,
                dotColor: Colors.grey.shade300,
                activeDotColor: const Color(0xffD6ED17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (controller.page != 2) {
                    controller.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeInOut);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffD6ED17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  getstarted ? 'next' : 'getStarted',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'yb',
                    fontSize: 25,
                    color: Color(0xff606060),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
