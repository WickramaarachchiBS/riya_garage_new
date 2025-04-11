import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riya_garage/View/Screens/Honda.dart';
import '../../Model/DetailsProvider.dart';
import '../AppColors.dart';
import 'Components/ProvidersListTileWidget.dart';
import 'Components/ModalWidgetDistrict.dart';

class SearchTownScreen extends StatefulWidget {
  const SearchTownScreen({super.key});

  @override
  _SearchTownScreenState createState() => _SearchTownScreenState();
}

class _SearchTownScreenState extends State<SearchTownScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredProviders = [];

  @override
  void initState() {
    super.initState();
    // Initialize data if needed
    _filteredProviders = [];

    // Add listener to controller to update search when text changes
    _searchController.addListener(() {
      _filterProviders(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Providers",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.color8,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  screenWidth <= 600 ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0) : const EdgeInsets.symmetric(horizontal: 200.0),
              // const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: screenHeight * 0.05,
                      child: SearchBar(
                        controller: _searchController,
                        onChanged: (query) {
                          _filterProviders(query);
                        },
                        leading: const Icon(Icons.search, size: 20),
                        hintText: 'Search Town',
                        hintStyle: WidgetStatePropertyAll(TextStyle(fontSize: 14.0)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0), // Set your desired radius
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                        ),
                        shadowColor: WidgetStateProperty.all(
                          Colors.white,
                        ),
                        backgroundColor: WidgetStateProperty.all(
                          Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<DetailsProvider>(
                builder: (context, providers, child) {
                  // If search query is empty, show all providers
                  var displayProviders = _filteredProviders.isEmpty ? providers.availableProviders : _filteredProviders;

                  return ListView.builder(
                    itemCount: displayProviders.length,
                    itemBuilder: (context, index) {
                      var provider = displayProviders[index];

                      return ProvidersListTileWidget(
                        screenWidth: screenWidth,
                        providerName: provider['name'],
                        providerAddress: provider['des'],
                        providerPhoneNumber: provider['call'],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to filter providers based on search query
  void _filterProviders(String query) {
    final providers = Provider.of<DetailsProvider>(context, listen: false);

    if (query.isEmpty) {
      setState(() {
        _filteredProviders = [];
      });
    } else {
      setState(() {
        _filteredProviders = providers.availableProviders.where((provider) {
          return provider['name'].toString().toLowerCase().contains(query.toLowerCase()) ||
              provider['des'].toString().toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }
}
