import 'package:flutter/material.dart';

class HomePageFirebaseImageWidget extends StatelessWidget {
  const HomePageFirebaseImageWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth <= 600 ? screenWidth * 0.40 : screenWidth * 0.2,
      height: screenWidth <= 600 ? screenHeight * 0.17 : screenHeight * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(
          top: screenWidth <= 600 ? screenWidth * 0.06 : screenWidth * 0.03, bottom: screenWidth <= 600 ? screenWidth * 0.00 : screenWidth * 0.03),
      child: Image.asset(
        'assets/RiyerawhiteLOGO.png',
        width: screenWidth * 0.8,
        height: screenHeight * 0.1,
        fit: BoxFit.contain,
      ),
    );
  }
}

// screenWidth <= 600 ? screenWidth * 0.2 : screenWidth * 0.02,
