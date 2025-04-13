Future<void> populateMaintenanceData() async {
  Map<String, Map<String, List<Map<String, dynamic>>>> data = {
    'zotye': {
      'colombo': [
        {'id': '1', 'name': 'AutoStar Bajaj Service', 'des': 'No. 125, Galle Road, Colombo 04', 'call': '0112456789'},
        {'id': '2', 'name': 'Prime Motors', 'des': 'No. 45, Duplication Road, Colombo 03', 'call': '0112345678'}
      ],
      'kandy': [
        {'id': '1', 'name': 'Bajaj Central Services', 'des': 'No. 78, Peradeniya Road, Kandy', 'call': '0812376540'},
        {'id': '2', 'name': 'Hill Country Motors', 'des': '156 Katugastota Road, Kandy', 'call': '0812345987'}
      ],
      'galle': [
        {'id': '1', 'name': 'Galle Bajaj Service', 'des': 'No. 12, Galle Road, Galle', 'call': '0912234567'},
        {'id': '2', 'name': 'Southern Motors', 'des': 'No. 45, Main Street, Galle', 'call': '0912345678'}
      ],
      'matara': [
        {'id': '1', 'name': 'Matara Bajaj Service', 'des': 'No. 10, Matara Road, Matara', 'call': '0412234567'},
        {'id': '2', 'name': 'Southern Bajaj Service', 'des': 'No. 20, Main Street, Matara', 'call': '0412345678'}
      ],
      'anuradapura': [
        {'id': '1', 'name': 'Anuradapura Bajaj Service', 'des': 'No. 5, Anuradapura Road, Anuradapura', 'call': '0252234567'},
        {'id': '2', 'name': 'North Central Motors', 'des': 'No. 15, Main Street, Anuradapura', 'call': '0252345678'}
      ],
      'badulla': [
        {'id': '1', 'name': 'Badulla Bajaj Service', 'des': 'No. 8, Badulla Road, Badulla', 'call': '0552234567'},
        {'id': '2', 'name': 'Uva Motors', 'des': 'No. 18, Main Street, Badulla', 'call': '0552345678'}
      ],
      'kegalle': [
        {'id': '1', 'name': 'Kegalle Bajaj Service', 'des': 'No. 6, Kegalle Road, Kegalle', 'call': '0352234567'},
        {'id': '2', 'name': 'Sabaragamuwa Motors', 'des': 'No. 16, Main Street, Kegalle', 'call': '0352345678'}
      ],
      'kurunegala': [
        {'id': '1', 'name': 'Kurunegala Bajaj Service', 'des': 'No. 7, Kurunegala Road, Kurunegala', 'call': '0372234567'},
        {'id': '2', 'name': 'North Western Motors', 'des': 'No. 17, Main Street, Kurunegala', 'call': '0372345678'}
      ],
      'nuwaraeliya': [
        {'id': '1', 'name': 'Nuwara Eliya Bajaj Service', 'des': 'No. 9, Nuwara Eliya Road, Nuwara Eliya', 'call': '0522234567'},
        {'id': '2', 'name': 'Hill Country Motors', 'des': 'No. 19, Main Street, Nuwara Eliya', 'call': '0522345678'}
      ],
      'trincomalee': [
        {'id': '1', 'name': 'Trincomalee Bajaj Service', 'des': 'No. 11, Trincomalee Road, Trincomalee', 'call': '0262234567'},
        {'id': '2', 'name': 'Eastern Motors', 'des': 'No. 21, Main Street, Trincomalee', 'call': '0262345678'}
      ],
      'jaffna': [
        {'id': '1', 'name': 'Jaffna Bajaj Service', 'des': 'No. 13, Jaffna Road, Jaffna', 'call': '0212234567'},
        {'id': '2', 'name': 'Northern Motors', 'des': 'No. 23, Main Street, Jaffna', 'call': '0212345678'}
      ],
      'batticaloa': [
        {'id': '1', 'name': 'Batticaloa Bajaj Service', 'des': 'No. 14, Batticaloa Road, Batticaloa', 'call': '0652234567'},
        {'id': '2', 'name': 'Eastern Bajaj Service', 'des': 'No. 24, Main Street, Batticaloa', 'call': '0652345678'}
      ],
      'anuradapura': [
        {'id': '1', 'name': 'Anuradapura Bajaj Service', 'des': 'No. 5, Anuradapura Road, Anuradapura', 'call': '0252234567'},
        {'id': '2', 'name': 'North Central Motors', 'des': 'No. 15, Main Street, Anuradapura', 'call': '0252345678'}
      ],
      'gampaha': [
        {'id': '1', 'name': 'Gampaha Bajaj Service', 'des': 'No. 17, Gampaha Road, Gampaha', 'call': '0332234567'},
        {'id': '2', 'name': 'Western Motors', 'des': 'No. 27, Main Street, Gampaha', 'call': '0332345678'}
      ],
      'kalutara': [
        {'id': '1', 'name': 'Kalutara Bajaj Service', 'des': 'No. 18, Kalutara Road, Kalutara', 'call': '0342234567'},
        {'id': '2', 'name': 'Western Bajaj Service', 'des': 'No. 28, Main Street, Kalutara', 'call': '0342345678'}
      ],
    },
  };
}
