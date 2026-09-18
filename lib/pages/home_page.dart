import 'package:flutter/material.dart';
import 'package:travelappg16/models/country_model.dart';
import 'package:travelappg16/widgets/tour_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.blueGrey, size: 28),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: .min,
          children: [
            const Icon(Icons.rocket, color: Colors.blue, size: 30),
            const SizedBox(width: 8),
            const Text(
              'DiscountTour',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const Text(
              'Find the best tour',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                'lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Country',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            ),

            const SizedBox(height: 18),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TourCardWidget(countryModel: countryExample),
                  TourCardWidget(countryModel: countryExample),
                  TourCardWidget(countryModel: countryExample),
                  TourCardWidget(countryModel: countryExample),
                  TourCardWidget(countryModel: countryExample),
                  TourCardWidget(countryModel: countryExample),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
