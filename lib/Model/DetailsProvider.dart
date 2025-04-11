import 'package:flutter/cupertino.dart';
import 'package:riya_garage/Data/Bajaj/Maintenance/Colombo.dart';

import '../Data/Bajaj/Maintenance/Ampara.dart';
import '../Data/Bajaj/Maintenance/Anuradapura.dart';
import 'dataClass.dart';

class DetailsProvider with ChangeNotifier {
  String? company;
  String? category;
  String? province;
  String? city;

  late List<Map<String, dynamic>> availableProviders = maintanceColombo;

  setCompany(String? newCompanyName) {
    print('setCompany');
    print(newCompanyName);
    company = newCompanyName;
    notifyListeners();
  }

  setCategory(String? newCategory) {
    print(newCategory);
    category = newCategory;
    setAvailableProviders();
    notifyListeners();
  }

  setCity(String? newCity) {
    print(newCity);
    city = newCity;
    // print(company+category+city);
    // setAvailableProviders();
    notifyListeners();
  }

  setProvince(String? newProvince) {
    print('setProvince');
    province = newProvince;
    notifyListeners();
  }

  setAvailableProviders() {
    print('setAvailableProviders');
    DataClass ss = new DataClass();
    availableProviders = ss.getListOfProviders((company ?? '') + (category ?? '') + (province ?? '') + (city ?? ''));
    notifyListeners();
  }
}
