import 'package:flutter/material.dart';
import 'package:travelappg16/pages/home_page.dart';

class WelcomeWidget extends StatelessWidget {
  Size size;
  String title;
  String description;
  String asset;
  Color bgColor;
  bool showButton;

  WelcomeWidget({
    super.key,
    required this.size,
    required this.title,
    required this.description,
    required this.asset,
    required this.bgColor,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(32),
      margin: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: bgColor,
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Image.asset("assets/images/$asset.png", height: size.height / 5),
          SizedBox(height: 32),
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: .bold,
              color: Colors.white,
            ),
          ),
          Text(
            description,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          showButton
              ? Padding(
                  padding: EdgeInsetsGeometry.only(top: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text("Vamos!"),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
