import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:travelappg16/widgets/welcome_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: GFCarousel(
          height: size.height,
          hasPagination: true,
          enableInfiniteScroll: false,
          enlargeMainPage: true,
          items: [
            WelcomeWidget(
              size: size,
              title: "Viaja",
              asset: "avion",
              bgColor: Colors.red,
              description:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when d",
            ),
            WelcomeWidget(
              size: size,
              title: "Imprime tus tickets",
              description:
                  " model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
              asset: "print",
              bgColor: Colors.orange,
            ),
            WelcomeWidget(
              size: size,
              title: "Agenda tus viajes",
              description:
                  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Lat",
              asset: "agregar",
              bgColor: Colors.cyan,
              showButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
