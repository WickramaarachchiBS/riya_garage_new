import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Model/DetailsProvider.dart';
import 'package:riya_garage/View/Screens/Components/HomePageBoxWidget.dart';
import '/View/AppColors.dart';

class ModalDistrictBottomSheet extends StatefulWidget {
  const ModalDistrictBottomSheet({super.key});

  @override
  State<ModalDistrictBottomSheet> createState() => _ModalDistrictBottomSheetState();
}

class _ModalDistrictBottomSheetState extends State<ModalDistrictBottomSheet> {
  String selectedModal = 'District'; // Default to Home

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        margin: screenWidth <= 600 ? const EdgeInsets.only(top: 10.0) : const EdgeInsets.only(top: 15.0),
        child: SizedBox(
          width: screenWidth <= 600 ? screenWidth * 0.8 : screenWidth * 0.26,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(AppColors.color9),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selectedModal,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20.0),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 30.0,
                ),
              ],
            ),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return SafeArea(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5.0),
                      height: screenHeight * 0.7,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Ampara');
                                      setState(() {
                                        selectedModal = 'Ampara';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Ampara',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Anuradhapura');
                                      setState(() {
                                        selectedModal = 'Anuradhapura';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Anuradhapura',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Badulla');
                                      setState(() {
                                        selectedModal = 'Badulla';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Badulla',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Batticaloa');
                                      setState(() {
                                        selectedModal = 'Batticaloa';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Batticaloa',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Colombo');
                                      setState(() {
                                        selectedModal = 'Colombo';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Colombo',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Galle');
                                      setState(() {
                                        selectedModal = 'Galle';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Galle',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Gampaha');
                                      setState(() {
                                        selectedModal = 'Gampaha';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Gampaha',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Hambantota');
                                      setState(() {
                                        selectedModal = 'Hambantota';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Hambantota',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Jaffna');
                                      setState(() {
                                        selectedModal = 'Jaffna';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Jaffna',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Kalutara');
                                      setState(() {
                                        selectedModal = 'Kalutara';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Kalutara',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Kandy');
                                      setState(() {
                                        selectedModal = 'Kandy';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Kandy',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Kegalle');
                                      setState(() {
                                        selectedModal = 'Kegalle';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Kegalle',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Kilinochchi');
                                      setState(() {
                                        selectedModal = 'Kilinochchi';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Kilinochchi',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Kurunegala');
                                      setState(() {
                                        selectedModal = 'Kurunegala';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Kurunegala',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Mannar');
                                      setState(() {
                                        selectedModal = 'Mannar';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Mannar',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Matale');
                                      setState(() {
                                        selectedModal = 'Matale';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Matale',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Matara');
                                      setState(() {
                                        selectedModal = 'Matara';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Matara',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Monaragala');
                                      setState(() {
                                        selectedModal = 'Monaragala';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Monaragala',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Mullaitivu');
                                      setState(() {
                                        selectedModal = 'Mullaitivu';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Mullaitivu',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Nuwara Eliya');
                                      setState(() {
                                        selectedModal = 'Nuwara Eliya';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Nuwara Eliya',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Polonnaruwa');
                                      setState(() {
                                        selectedModal = 'Polonnaruwa';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Polonnaruwa',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Puttalam');
                                      setState(() {
                                        selectedModal = 'Puttalam';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Puttalam',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Rathnapura');
                                      setState(() {
                                        selectedModal = 'Rathnapura';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Rathnapura',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Trincomalee');
                                      setState(() {
                                        selectedModal = 'Trincomalee';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Trincomalee',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<DetailsProvider>(context, listen: false).setCity('Vavuniya');
                                      setState(() {
                                        selectedModal = 'Vavuniya';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: HomePageBoxWidget(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight * 0.3,
                                      text: 'Vavuniya',
                                      boxWidth: screenWidth <= 600 ? 0.4 : 0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
