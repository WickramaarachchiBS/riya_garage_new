import 'package:cloud_firestore/cloud_firestore.dart';

class DataClass {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getListOfProviders(String details) async {
    // Parse company, category, and city from the details string
    final RegExp companyRegex = RegExp(r'^(Zotye|Honda|Suzuki|Toyota|Benz|LandRover)');
    final RegExp categoryRegex = RegExp(r'(Maintenance|SpareParts)');

    String? companyMatch = companyRegex.firstMatch(details)?.group(0);
    String? categoryMatch = categoryRegex.firstMatch(details)?.group(0);

    if (companyMatch == null || categoryMatch == null) {
      print("Invalid details format: $details");
      return [];
    }

    // Convert to lowercase for Firebase path
    String company = companyMatch.toLowerCase();
    String category = categoryMatch.toLowerCase();

    // Extract city by removing company and category from details
    String city = details.replaceFirst(companyMatch, '').replaceFirst(categoryMatch, '');

    // Convert city name to lowercase for Firebase path
    city = city.toLowerCase();
    print("Fetching data for: $category/$city");

    try {
      // Get documents from Firebase based on the path
      final QuerySnapshot snapshot = await _firestore.collection(company).doc(category).collection(city).get();

      print("Documents found: ${snapshot.docs.length}");

      // Convert to List<Map<String, dynamic>>
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        print("Document data: $data");
        // Ensure each map has a unique id
        return {
          'doc_id': doc.id,
          'name': data['name'] ?? '',
          'id': data['id'] ?? '',
          'phone': data['call'] ?? '',
          'description': data['des'] ?? '',
        };
      }).toList();
    } catch (e) {
      print("Error fetching providers: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getListOfProviders2(String details) async {
    // Parse company, category, and city from the details string

    final RegExp categoryRegex = RegExp(r'(Breakdown|Tyreshops)');

    String? categoryMatch = categoryRegex.firstMatch(details)?.group(0);

    if (categoryMatch == null) {
      print("Invalid details format: $details");
      return [];
    }

    // Convert to lowercase for Firebase path
    String category = categoryMatch.toLowerCase();

    // Extract city by removing company and category from details
    String city = details.replaceFirst(categoryMatch, '');

    // Convert city name to lowercase for Firebase path
    city = city.toLowerCase();
    print("Fetching data for: $category/$city");

    try {
      // Get documents from Firebase based on the path
      final QuerySnapshot snapshot = await _firestore.collection(category).doc('districts').collection(city).get();

      print("Documents found: ${snapshot.docs.length}");

      // Convert to List<Map<String, dynamic>>
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        print("Document data: $data");
        // Ensure each map has a unique id
        return {
          'doc_id': doc.id,
          'name': data['name'] ?? '',
          'id': data['id'] ?? '',
          'phone': data['call'] ?? '',
          'description': data['des'] ?? '',
        };
      }).toList();
    } catch (e) {
      print("Error fetching providers: $e");
      return [];
    }
  }
}
