import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String dateTime = DateFormat("yMMMMd").format(DateTime.now());

Widget cityHeader(String location, String temp, String iconID, String main,
    String fellLike, String desc,String dateOfUpdate) {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.blue,
              ),
              Text(
                location,
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
          Text(
            dateTime,
          ),
          Text(desc),
          Text(' last Update $dateOfUpdate'),

        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/weather/$iconID.png",
                height: 60,
                width: 60,
              ),
              Text(main)
            ],
          ),
          Column(children: [
            Text(
              '${double.parse(temp).round().toString()} \u2103 ',
              style: const TextStyle(fontSize: 45),
            ),
            Text('feel Like $fellLike \u2103')
          ])
        ],
      ),
    ],
  );
}
