import 'package:flutter/material.dart';
import 'dataClass.dart';

class DetailsProvider with ChangeNotifier {
  String? company;
  String? category;
  String? province;
  String? city;

  List<Map<String, dynamic>> _availableProviders = [];
  List<Map<String, dynamic>> get availableProviders => _availableProviders;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  setCompany(String? newCompanyName) {
    print('setCompany: $newCompanyName');
    company = newCompanyName;
    notifyListeners();
  }

  setCategory(String? newCategory) {
    print('setCategory: $newCategory');
    category = newCategory;
    notifyListeners();
  }

  setCity(String? newCity) {
    print('setCity: $newCity');
    city = newCity;
    notifyListeners();
  }

  setProvince(String? newProvince) {
    print('setProvince: $newProvince');
    province = newProvince;
    notifyListeners();
  }

  Future<void> setAvailableProviders() async {
    if (company == null || category == null || city == null) {
      _error = "Please select company, category, and city";
      notifyListeners();
      return;
    }

    print('Loading providers for: ${company! + category! + city!}');

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      DataClass dataClass = DataClass();
      List<Map<String, dynamic>> providers = await dataClass.getListOfProviders((company ?? '') + (category ?? '') + (city ?? ''));

      _availableProviders = providers;
      print('Providers loaded: $_availableProviders');
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error loading providers: $e');
      _error = "Failed to load providers: ${e.toString()}";
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> setAvailableProviders2() async {
    if (category == null || city == null) {
      _error = "Please select category, and city";
      notifyListeners();
      return;
    }

    print('Loading providers for: ${category! + city!}');

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      DataClass dataClass = DataClass();
      List<Map<String, dynamic>> providers = await dataClass.getListOfProviders2((category ?? '') + (city ?? ''));

      _availableProviders = providers;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error loading providers: $e');
      _error = "Failed to load providers: ${e.toString()}";
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearProviders() {
    _availableProviders = [];
    _isLoading = false;
    _error = null;
    notifyListeners();
  }
}
