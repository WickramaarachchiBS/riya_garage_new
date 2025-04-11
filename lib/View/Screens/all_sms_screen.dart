import 'package:flutter/material.dart';
import '/View/Screens/Components/ChatNumberWidget.dart';
import '/View/Screens/Components/HomePageFirebaseImageWidget.dart';
import '/View/AppColors.dart';

class SmsScreen extends StatelessWidget {
  const SmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenWidth, screenHeight * 0.09),
          child: AppBar(
            title: HomePageFirebaseImageWidget(screenWidth: screenWidth, screenHeight: screenHeight),
            centerTitle: true,
            backgroundColor: AppColors.color9,
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ChatNumberWidget(chatNumber: '05489922'),
            ],
          ),
        ));
  }
}
