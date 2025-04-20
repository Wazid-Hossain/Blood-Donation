import 'package:blood_donetion/main.dart';
import 'package:flutter/material.dart';
// import 'donor_card.dart'; // <-- make sure this file has your DonorCard widget

class DonorListView extends StatelessWidget {
  final List<Map<String, String>> donors;

  const DonorListView({super.key, required this.donors});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        int crossAxisCount = 2; // Mobile default
        if (width > 600) crossAxisCount = 3;
        if (width > 900) crossAxisCount = 4;
        if (width > 1200) crossAxisCount = 5;

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75, // Adjust this to fit your card's shape
          ),
          itemCount: donors.length,
          itemBuilder: (context, index) {
            return DonorCard(donor: donors[index]);
          },
        );
      },
    );
  }
}
