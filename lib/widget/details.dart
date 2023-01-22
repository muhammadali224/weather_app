import 'package:flutter/material.dart';

Widget weatherDetails(
    String minTemp, String maxTemp, String sunrise, String sunset) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      rowBuilder('Min', '${double.parse(minTemp).floor().toString()}  \u2103', 'minTemp',
          color: Colors.blue),
      rowBuilder('Max', '${double.parse(maxTemp).floor().toString()}  \u2103', 'maxTemp',
          color: Colors.redAccent),

      rowBuilder(
          'Sun Rise',
          sunrise,
          'sunrise',
          color: Colors.yellowAccent),
      rowBuilder(
          'Sun Set',
          sunset,
          'sunset',
          color: Colors.deepOrange[400]),
    ],
  );
}

Row rowBuilder(String title, String value, String iconName, {Color? color}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/icons/$iconName.png',
              height: 50,
              width: 50,
              color: color,
            ),
            const SizedBox(height: 20),
            Text(value),
          ],
        ),
      ),
    ],
  );
}
