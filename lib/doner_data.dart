class DonorData {
  static final List<Map<String, String>> _donors = [
    {
      'name': 'John Doe',
      'bloodType': 'O+',
      'contact': '01234-567890',
      'emergency': '09876-543210',
      'address': 'Dhaka, Bangladesh',
      'lastDonation': '12 Mar 2025',
      'status': 'Available',
      'image': 'https://i.pravatar.cc/100?img=3'
    },
    {
      'name': 'Jane Smith',
      'bloodType': 'O+',
      'contact': '01700-123456',
      'emergency': '01900-654321',
      'address': 'Chittagong, Bangladesh',
      'lastDonation': '20 Feb 2025',
      'status': 'Available',
      'image': 'https://i.pravatar.cc/100?img=5'
    },
    {
      'name': 'Ali Khan',
      'bloodType': 'A+',
      'contact': '01900-789456',
      'emergency': '01800-123789',
      'address': 'Khulna, Bangladesh',
      'lastDonation': '25 Jan 2025',
      'status': 'Not Available',
      'image': 'https://i.pravatar.cc/100?img=6'
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
      'name': 'Saeid Hossain',
      'bloodType': 'A+',
      'contact': '01234-567890',
      'emergency': '09876-543210',
      'address': 'Dhaka, Bangladesh',
      'lastDonation': '12 Mar 2025',
      'status': 'Available',
      'image': 'https://i.pravatar.cc/100?img=3'
    },
    // Add more donors as needed
  ];

  static List<Map<String, String>> getDonorsByBloodType(String bloodType) {
    return _donors.where((donor) => donor['bloodType'] == bloodType).toList();
  }
}
