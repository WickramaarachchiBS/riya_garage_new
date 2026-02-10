import 'package:flutter/material.dart';

import '../../AppColors.dart';

class HomePageBoxWidget extends StatelessWidget {
  const HomePageBoxWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.text,
    required this.boxWidth,
  });

  final double screenWidth;
  final double screenHeight;
  final String text;
  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * boxWidth,
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        color: AppColors.color10,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // Shadow color with opacity
            spreadRadius: 0, // How much the shadow spreads
            blurRadius: 0, // Softening the shadow (higher value means more blur)
            offset: const Offset(0, 0), // Offset in the x and y directions
          ),
        ], // Make it a circle
      ),
      margin: EdgeInsets.only(top: screenHeight * 0.05),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
