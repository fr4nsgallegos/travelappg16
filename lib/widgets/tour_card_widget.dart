import 'package:flutter/material.dart';
import 'package:travelappg16/models/country_model.dart';

class TourCardWidget extends StatelessWidget {
  final CountryModel countryModel;

  const TourCardWidget({super.key, required this.countryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 170,
      height: 230,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.srcATop,
          ),
          image: NetworkImage(countryModel.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'NEW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 80,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                          "https://testingbot.com/free-online-tools/random-avatar/100",
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                          "https://testingbot.com/free-online-tools/random-avatar/200",
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                          "https://testingbot.com/free-online-tools/random-avatar/300",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    countryModel.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    countryModel.tours,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      countryModel.rating,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Icon(Icons.star, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
