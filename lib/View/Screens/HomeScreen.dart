import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riya_garage/Data/Bajaj/Maintenance/adddatatodatabase.dart';
import 'package:riya_garage/View/Screens/Components/ModalWidgetDistrict.dart';
import '../../Model/DetailsProvider.dart';
import '../AppColors.dart';
import 'Components/HomePageBoxWidget.dart';
import 'Components/NewHomePageBoxWidget.dart';
import 'Components/HomePageFirebaseImageWidget.dart';
import 'Components/ModalWidget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const ModalBottomSheet(),
              const ModalDistrictBottomSheet(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // addDistricts();
                      _handleTap(context, 'Maintenance', '/searchTown');
                    },
                    child: NewHomePageBoxWidget(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      text: 'Maintenance & Repairs',
                      boxWidth: 0.40,
                      image: 'assets/Maintenance-Repairs-icon.png',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      _handleTap(context, 'SpareParts', '/searchTown');
                    },
                    child: NewHomePageBoxWidget(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      text: 'Maintenance & Repairs',
                      boxWidth: 0.40,
                      image: 'assets/SpareParts-BodyParts-icon.png',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _handleTap2(context, 'Breakdown', '/searchTown2');
                      // Navigator.pushNamed(context, '/searchTown2');
                    },
                    child: NewHomePageBoxWidget(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      text: 'Maintenance & Repairs',
                      boxWidth: 0.40,
                      image: 'assets/BreakdownServices.png',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      _handleTap2(context, 'Tyreshops', '/searchTown2');
                      // Navigator.pushNamed(context, '/searchTown2');
                    },
                    child: NewHomePageBoxWidget(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      text: 'Maintenance & Repairs',
                      boxWidth: 0.40,
                      image: 'assets/TyreShopsServices.png',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _handleTap(BuildContext context, String category, String route) {
  final detailsProvider = Provider.of<DetailsProvider>(context, listen: false);

  // Check if company is null or empty
  if (detailsProvider.company == null || detailsProvider.company!.isEmpty || detailsProvider.city == null || detailsProvider.city!.isEmpty) {
    _showCompanySelectionAlert(context);
  } else {
    Navigator.pushNamed(context, route);
  }
  detailsProvider.setCategory(category);
}

void _handleTap2(BuildContext context, String category, String route) {
  final detailsProvider = Provider.of<DetailsProvider>(context, listen: false);

  // Check if company is null or empty
  if (detailsProvider.city == null || detailsProvider.city!.isEmpty) {
    _showCompanySelectionAlert2(context);
  } else {
    Navigator.pushNamed(context, route);
  }
  detailsProvider.setCategory(category);
}

void _showCompanySelectionAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Empty Fields!'),
        content: const Text('Please select a brand and a city before proceeding.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
    },
  );
}

void _showCompanySelectionAlert2(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Empty Fields!'),
        content: const Text('Please select a city before proceeding.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
    },
  );
}
