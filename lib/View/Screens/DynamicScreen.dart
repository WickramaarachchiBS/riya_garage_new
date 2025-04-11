import 'package:flutter/material.dart';
import '/View/Screens/HomeScreen.dart';
import '/View/Screens/all_sms_screen.dart';
import '/View/AppColors.dart';

class DynamicScreen extends StatefulWidget {
  const DynamicScreen({super.key});

  @override
  State<DynamicScreen> createState() => _DynamicScreenState();
}

List<String> options = ['Home', 'SMS'];

class _DynamicScreenState extends State<DynamicScreen> {
  // Define options inside the class
  final List<String> options = ['Home', 'SMS'];
  late String currentScreen;

  @override
  void initState() {
    super.initState();
    currentScreen = options[0]; // Initialize default to Home
  }

  Widget _getSelectedScreen() {
    switch (currentScreen) {
      case 'Home':
        return const MyHomePage();
      case 'SMS':
        return const SmsScreen();
      default:
        return const MyHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedScreen(),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 80.0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
              color: Colors.transparent,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentScreen = options[0];
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<String>(
                          activeColor: AppColors.buttonColor,
                          fillColor: MaterialStateProperty.all<Color>(AppColors.color8),
                          value: options[0],
                          groupValue: currentScreen,
                          onChanged: (value) {
                            setState(() {
                              currentScreen = value!;
                            });
                          },
                        ),
                        const Text(
                          'Services',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentScreen = options[1];
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<String>(
                          activeColor: AppColors.buttonColor,
                          fillColor: MaterialStateProperty.all<Color>(AppColors.color8),
                          value: options[1],
                          groupValue: currentScreen,
                          onChanged: (value) {
                            setState(() {
                              currentScreen = value!;
                            });
                          },
                        ),
                        const Text(
                          'SMS',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
