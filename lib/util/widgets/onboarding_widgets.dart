import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.imageurl,
    required this.description,
    required this.screenheight,
  });
  final String imageurl;
  final String description;
  final double screenheight;
  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
      delayDuration: const Duration(milliseconds: 200),
      animationDuration: const Duration(seconds: 1),
      animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                imageurl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              description,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'yb'),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
