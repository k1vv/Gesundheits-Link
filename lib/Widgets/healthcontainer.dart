// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class HealthButtonSmall extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String buttonText;
  final String imageAsset;
  final String caloriesValue;
  final String destinationPageRoute;
  final double gap;
  final String healthType;

  const HealthButtonSmall({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.buttonText,
    required this.imageAsset,
    required this.caloriesValue,
    required this.destinationPageRoute,
    required this.gap,
    required this.healthType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define routes

    return SizedBox(
      width: 145 * screenWidth / 375,
      height: 62 * screenHeight / 375,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, destinationPageRoute);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Color.fromARGB(50, 158, 158, 158),
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(height: 10 * screenHeight / 375),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10 * screenHeight / 375),
                Row(
                  children: [
                    Text(
                      buttonText,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: gap * screenHeight / 375,),
                    Image(
                      image: AssetImage(imageAsset),
                      width: 20 * screenWidth / 375,
                      height: 10 * screenHeight / 375,
                    ),
                  ],
                ),
                SizedBox(height: 15 * screenHeight / 375),
                Text(
                  caloriesValue,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  healthType,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
