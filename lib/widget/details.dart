import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../services/weather_service.dart';

Widget weatherDetails(
    String minTemp, String maxTemp, String sunrise, String sunset) {
  WeatherService weatherService = Get.put(WeatherService());
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      rowBuilder('Min', '${double.parse(minTemp).floor().toString()}  \u2103', 'minTemp',
          color: Colors.blue),
      rowBuilder('Max', '${double.parse(maxTemp).floor().toString()}  \u2103', 'maxTemp',
          color: Colors.redAccent),
      rowBuilder(
          'Sun Set',
          sunset,
          'sunset',
          color: Colors.deepOrange[400]),
      rowBuilder(
          'Sun Rise',
          sunrise,
          'sunrise',
          color: Colors.yellowAccent),
    ],
  );
}

Row rowBuilder(String title, String value, String iconName, {Color? color}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 170,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/icons/$iconName.png',
              height: 60,
              width: 60,
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
