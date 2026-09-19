import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

class CarouselPage extends StatelessWidget {
  CarouselPage({super.key});

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2015/05/08/08/49/mountains-757731_1280.jpg",
    "https://cdn.pixabay.com/photo/2017/02/14/03/03/ama-dablam-2064522_1280.jpg",
    "https://cdn.pixabay.com/photo/2019/07/22/04/52/alps-4354164_1280.jpg",
    "https://cdn.pixabay.com/photo/2025/01/14/13/55/nature-9332892_1280.jpg",
    "https://cdn.pixabay.com/photo/2020/09/11/00/11/landscape-5561678_1280.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carousel Page")),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            CarouselSlider(
              items: imageList
                  .map(
                    (foto) => ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(25),
                      child: Image.network(foto, fit: BoxFit.cover),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 250,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                autoPlay: true,
                initialPage: 2,
                autoPlayCurve: Curves.easeInOutCubic,
              ),
            ),
            Divider(height: 64, thickness: 4),
            GFCarousel(
              autoPlay: true,
              autoPlayCurve: Curves.easeInOutExpo,
              autoPlayAnimationDuration: Duration(seconds: 2),
              // initialPage: 2,
              hasPagination: true,
              passiveIndicator: Colors.red,
              activeIndicator: Colors.cyan,
              enableInfiniteScroll: false,
              enlargeMainPage: true,
              height: 200,
              items: imageList
                  .map(
                    (foto) => ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(25),
                      child: Image.network(foto, fit: BoxFit.cover),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
