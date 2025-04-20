import 'package:blood_donetion/doner_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// New component file

void main() {
  runApp(const BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const BloodTypeSelectionPage(),
    );
  }
}

class BloodTypeSelectionPage extends StatelessWidget {
  const BloodTypeSelectionPage({super.key});

  final List<String> bloodTypes = const [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Select Blood Type',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: bloodTypes.map((type) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DonorListPage(bloodType: type),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.shade100,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class DonorListPage extends StatelessWidget {
  final String bloodType;

  const DonorListPage({super.key, required this.bloodType});

  @override
  Widget build(BuildContext context) {
    final donors = DonorData.getDonorsByBloodType(bloodType);

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Donors for $bloodType',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _getGridCount(context), // Responsive columns
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.75, // Adjust card height and width
              ),
              itemCount: donors.length,
              itemBuilder: (context, index) {
                final donor = donors[index];
                return DonorCard(donor: donor);
              },
            ),
          ),
        ),
      ),
    );
  }

  // Function to make grid count responsive based on screen width
  int _getGridCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // If screen width is less than 600px, 1 card per row (for smaller screens)
    if (screenWidth < 600) {
      return 1;
    }
    // If screen width is between 600 and 900px, 2 cards per row
    else if (screenWidth < 900) {
      return 2;
    }
    // If screen width is above 900px, 3 cards per row
    else {
      return 3;
    }
  }
}

class DonorCard extends StatelessWidget {
  final Map<String, String> donor;

  const DonorCard({super.key, required this.donor});

  @override
  Widget build(BuildContext context) {
    bool isAsset = donor['imageType'] == 'asset';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.red.shade100,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Picture (Check asset vs network)
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: isAsset
                ? Image.asset(
                    donor['image']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    donor['image']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              donor['name']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text('📞 ${donor['contact']}'),
          Text('📱 Emergency: ${donor['emergency']}'),
          Text('🏠 ${donor['address']}'),
          const SizedBox(height: 8),
          Text('🩸 Last Donation: ${donor['lastDonation']}'),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                donor['status'] == 'Available'
                    ? Icons.check_circle
                    : Icons.cancel,
                color:
                    donor['status'] == 'Available' ? Colors.green : Colors.red,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                donor['status']!,
                style: TextStyle(
                  color: donor['status'] == 'Available'
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
