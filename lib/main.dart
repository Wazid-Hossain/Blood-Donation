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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5, // Adjusted to maintain proper aspect ratio
          ),
          itemCount: bloodTypes.length,
          itemBuilder: (context, index) {
            final type = bloodTypes[index];
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
          },
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                final gridCount = _getGridCount(constraints.maxWidth);

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: donors.length,
                  itemBuilder: (context, index) {
                    final donor = donors[index];
                    return DonorCard(donor: donor);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Function to make grid count responsive based on screen width
  int _getGridCount(double maxWidth) {
    const double minCardWidth = 180; // or 160 if you want tighter fit
    int count = (maxWidth / minCardWidth).floor();
    return count < 1 ? 1 : count;
  }
}

// Function to make grid count responsive based on screen width
int _getGridCount(double maxWidth) {
  const double minCardWidth = 180; // or 160 if you want tighter fit
  int count = (maxWidth / minCardWidth).floor();
  return count < 1 ? 1 : count;
}

class DonorCard extends StatelessWidget {
  final Map<String, String> donor;

  const DonorCard({super.key, required this.donor});

  @override
  Widget build(BuildContext context) {
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
        image: DecorationImage(
          image: AssetImage(donor['image']!),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
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
          // Wrapping text content in SingleChildScrollView to prevent overflow
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        color: donor['status'] == 'Available'
                            ? Colors.green
                            : Colors.red,
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
            ),
          ),
        ],
      ),
    );
  }
}
