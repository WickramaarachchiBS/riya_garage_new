import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/DetailsProvider.dart';
import '../AppColors.dart';
import 'Components/ProvidersListTileWidget.dart';
import 'Components/ModalWidgetDistrict.dart';

class SearchTownScreen2 extends StatefulWidget {
  const SearchTownScreen2({super.key});

  @override
  _SearchTownScreen2State createState() => _SearchTownScreen2State();
}

class _SearchTownScreen2State extends State<SearchTownScreen2> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredProviders = [];
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    // Add listener to controller to update search when text changes
    _searchController.addListener(() {
      _filterProviders(_searchController.text);
    });

    // Load data on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    if (_initialized) return;

    final detailsProvider = Provider.of<DetailsProvider>(context, listen: false);

    if (detailsProvider.category != null && detailsProvider.city != null) {
      await detailsProvider.setAvailableProviders2();
      _filterProviders(_searchController.text);
      _initialized = true;
    }
  }

  void _filterProviders(String query) {
    final detailsProvider = Provider.of<DetailsProvider>(context, listen: false);
    final providers = detailsProvider.availableProviders;

    if (query.isEmpty) {
      setState(() {
        _filteredProviders = providers;
      });
      return;
    }

    final filtered = providers.where((provider) {
      final name = provider['name']?.toString().toLowerCase() ?? '';
      final address = provider['address']?.toString().toLowerCase() ?? '';
      final searchLower = query.toLowerCase();

      return name.contains(searchLower) || address.contains(searchLower);
    }).toList();

    setState(() {
      _filteredProviders = filtered;
    });
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
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: screenHeight * 0.05,
                      child: SearchBar(
                        controller: _searchController,
                        hintText: 'Search Provider',
                        leading: const Icon(Icons.search, size: 20),
                        hintStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 14.0)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<DetailsProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (provider.error != null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            provider.error!,
                            style: const TextStyle(color: Colors.red),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => provider.setAvailableProviders(),
                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  }

                  if (_filteredProviders.isEmpty) {
                    // Initialize filtered providers if empty (first load)
                    if (provider.availableProviders.isNotEmpty && _filteredProviders.isEmpty) {
                      _filteredProviders = provider.availableProviders;
                    }

                    return const Center(
                      child: Text("No providers found for this location."),
                    );
                  }

                  return ListView.builder(
                    itemCount: _filteredProviders.length,
                    itemBuilder: (context, index) {
                      return ProvidersListTileWidget(
                        data: _filteredProviders[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<DetailsProvider>(context, listen: false).setAvailableProviders(),
        child: const Icon(Icons.refresh),
        backgroundColor: AppColors.color8,
      ),
    );
  }
}
