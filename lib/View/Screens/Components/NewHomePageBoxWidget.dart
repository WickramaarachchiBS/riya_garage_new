import 'package:flutter/material.dart';

import '../../AppColors.dart';

class NewHomePageBoxWidget extends StatelessWidget {
  const NewHomePageBoxWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.text,
    required this.boxWidth,
    required this.image,
  });

  final double screenWidth;
  final double screenHeight;
  final String text;
  final double boxWidth;
  final String image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth <= 600 ? screenWidth * 0.38 : screenWidth * 0.23,
      height: screenWidth <= 600 ? screenWidth * 0.4 : screenWidth * 0.13,
      // height: screenWidth * 0.39,
      decoration: BoxDecoration(
        color: AppColors.color8,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: screenWidth * 0.18, // Increase the image size (adjust as needed)
            height: screenHeight * 0.18, // Adjust height as needed
            fit: BoxFit.cover, // Maintain the aspect ratio of the image
          ),
        ],
      ),
    );
  }
}
