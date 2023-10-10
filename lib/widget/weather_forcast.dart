import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getDay(final day) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
  final x = DateFormat('EEE').format(time);
  return x;
}

Widget daily(String dateOfDay, String icon, String minTemp, String maxTemp) {
  return SizedBox(
    height: 65,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 1,
          width: 250,
          color: Colors.black,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                getDay(int.parse(dateOfDay)),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  color: Colors.black,
                ),
              ),
              Image.asset(
                "assets/images/weather/$icon.png",
                height: 40,
                width: 50,
              ),
              Text(
                "$maxTemp/$minTemp \u2103",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
