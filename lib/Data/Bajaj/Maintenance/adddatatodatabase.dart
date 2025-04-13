import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final List<String> districtNames = [
  "ampara",
  "anuradhapura",
  "badulla",
  "batticaloa",
  "colombo",
  "galle",
  "gampaha",
  "hambantota",
  "jaffna",
  "kalutara",
  "kandy",
  "kegalle",
  "kilinochchi",
  "kurunegala",
  "mannar",
  "matale",
  "matara",
  "monaragala",
  "mullaitivu",
  "nuwaraeliya",
  "polonnaruwa",
  "puttalam",
  "ratnapura",
  "trincomalee",
  "vavuniya",
];

Future<void> addDistricts() async {
  for (final name in districtNames) {
    try {
      await firestore.collection('tyreshops').doc('districts').collection(name).doc('1').set(
        {
          'id': '1',
          'name': 'demo shopname for $name',
          'call': '0771234567',
          'des': 'demo address for $name',
        },
      );
      print('✅ Successfully added: $name');
    } catch (e) {
      print('❌ Failed to add $name: $e');
    }
  }

  print('🎉 All district operations attempted!');
}
