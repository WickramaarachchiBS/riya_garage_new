import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Icons/IconCallWidget.dart';
import 'Icons/IconPersonWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProvidersListTileWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const ProvidersListTileWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Extract provider details from the data map
    final String providerName = data['name'] ?? '';
    final String providerAddress = data['description'] ?? data['des'] ?? '';
    final String providerPhoneNumber = data['phone'] ?? data['call'] ?? '';

    return Padding(
      padding: screenWidth <= 600 ? const EdgeInsets.symmetric(horizontal: 0.0) : const EdgeInsets.symmetric(horizontal: 40.0),
      child: ListTile(
        leading: IconPersonWidget(screenWidth: screenWidth),
        title: Text(providerName),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(providerAddress),
            //const SizedBox(height: 4),
            Text(providerPhoneNumber),
          ],
        ),
        trailing: GestureDetector(
          onTap: () async {
            final Uri launchUri = Uri(
              scheme: 'tel',
              path: providerPhoneNumber,
            );
            await launchUrl(launchUri);
          },
          child: IconCallWidget(
            screenWidth: screenWidth,
          ),
        ),
      ),
    );
  }
}
