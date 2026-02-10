import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riya_garage/View/Screens/SearchTownScreen2.dart';

import 'Model/DetailsProvider.dart';
import 'View/AppColors.dart';
import 'View/Screens/Bajaj.dart';
import 'View/Screens/DistrictsScreen.dart';
import 'View/Screens/HomeScreen.dart';
import 'View/Screens/Honda.dart';
import 'View/Screens/SearchTownScreen.dart';
import 'View/Screens/Suzuki.dart';
import 'View/Screens/Toyota.dart';
import 'View/Screens/DynamicScreen.dart';
import 'View/Screens/all_sms_screen.dart';
import 'View/Screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsProvider(),
      child: MaterialApp(
        title: 'Riya',
        theme: ThemeData(
          dialogBackgroundColor: AppColors.color2,
        ),
        routes: {
          '/home': (context) => const MyHomePage(), // Home route
          '/bajaj': (context) => const Bajaj(),
          '/suzuki': (context) => const Suzuki(),
          '/toyota': (context) => const Toyota(),
          '/honda': (context) => const Honda(),
          '/districts': (context) => const DistrictsScreen(),
          '/searchTown': (context) => const SearchTownScreen(), // Named route for SecondScreen
          '/searchTown2': (context) => const SearchTownScreen2(), // Named route for SecondScreen
          '/sms': (context) => const SmsScreen(), // Named route for SmsScreen
          '/dynamic': (context) => const DynamicScreen(), //Dynamic screen
          '/chat': (context) => const ChatScreen(),
        },
        initialRoute: '/dynamic',
      ),
    );
  }
}
