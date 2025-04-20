class DonorData {
  static final List<Map<String, String>> _donors = [
// For O+ blood type

    {
      'name': 'Aminul Islam Sujon',
      'bloodType': 'O+',
      'contact': '01889-918888',
      'emergency': 'N/A',
      'address': 'Colony, Naogaon',
      'lastDonation': 'N/A',
      'status': 'Available',
      'image': 'assets/images/sujon.jpg'
    },

    {
      'name': 'Wazid Hossain',
      'bloodType': 'O+',
      'contact': '01784880361',
      'emergency': '01737997860',
      'address': 'Colony, Naogaon',
      'lastDonation': '5 Aug 2024',
      'status': 'Available',
      'image': 'assets/images/wazid.jpg',
      'imageType': 'asset'
    },

    {
      'name': 'Mohammad Zakir Hossain',
      'bloodType': 'O+',
      'contact': '01764-948406',
      'emergency': 'N/A',
      'address': 'Colony, Naogaon',
      'lastDonation': 'N/A',
      'status': 'Available',
      'image': 'assets/images/jakir.jpg'
    },
    {
      'name': 'Masrul Hasan Himu',
      'bloodType': 'O+',
      'contact': '01765573637',
      'emergency': '01718745677',
      'address': 'Colony, Naogaon',
      'lastDonation': 'N/A',
      'status': 'Available',
      'image': 'assets/images/himu.jpg'
    },
    {
      'name': 'Mehedi Hasan Anik',
      'bloodType': 'O+',
      'contact': '0173208036',
      'emergency': '01515659667',
      'address': 'Colony, Naogaon',
      'lastDonation': 'N/A',
      'status': 'Available',
      'image': 'assets/images/anik.jpg'
    },
    // end of O+ blood type

    // A+ blood type
    {
      'name': 'RM Mithun',
      'bloodType': 'A+',
      'contact': '01791-939494',
      'emergency': 'N/A',
      'address': 'Colony, Naogaon',
      'lastDonation': 'N/A',
      'status': 'Available',
      'image': 'assets/images/mithun.jpg'
    },

    {
      'name': 'Md Bappy Ansari',
      'bloodType': 'A+',
      'contact': '01720-565738',
      'emergency': 'N/A',
      'address': 'Colony, Naogaon',
      'lastDonation': 'N/A',
      'status': 'Available',
      'image': 'assets/images/bappy.jpg'
    },

// end of A+ blood type

// AB+ Blood Type
    {
      'name': 'Md. Nahid Hossain',
      'bloodType': 'AB+',
      'contact': '01306-458417',
      'emergency': 'N/A',
      'address': 'Colony, Naogaon',
      'lastDonation': 'N/A',
      'status': 'Available',
      'image': 'assets/images/nahid.jpg'
    },
  ];

  static List<Map<String, String>> getDonorsByBloodType(String bloodType) {
    return _donors.where((donor) => donor['bloodType'] == bloodType).toList();
  }
}
