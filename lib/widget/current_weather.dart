
import 'package:flutter/material.dart';


String dateTime = DateTime.now().toString();

Widget currentWeatherDetails(String wind, String clouds, String humidity) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              'assets/icons/wind.png',
              color: Colors.blue,
            ),
          ),
          Text('$wind Km/H'),
        ],
      ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              'assets/icons/cloud.png',
              color: Colors.blue,
            ),
          ),
          Text('$clouds %'),
        ],
      ),
      Column(
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              'assets/icons/humidity.png',
              color: Colors.blue,
            ),
          ),
          Text('$humidity %'),
        ],
      ),
    ],
  );
}
