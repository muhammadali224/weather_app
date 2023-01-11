import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/widget/current_weather.dart';
import 'package:weather_app/widget/details.dart';

import '../services/weather_service.dart';
import '../widget/city_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherService weatherService = Get.put(WeatherService());
  String city = "";
  Weather? weatherData;
  Sun? sunData;
  String? date;

  Future<void> getData() async {
    weatherData = await weatherService.getWeatherCurrentLocation(
        weatherService.getLatitude().toString(),
        weatherService.getLongitude().toString());
    sunData = await weatherService.getSun(
        weatherService.getLatitude().toString(),
        weatherService.getLongitude().toString());
    setState(() {
      date=DateTime.now().toString();
    });
  }



  @override
  Widget build(BuildContext context) {
    //final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     Container(
        //         padding: const EdgeInsets.only(right: 5),
        //         child: AnimSearchBar(
        //           helpText: "Search City ..",
        //           autoFocus: true,
        //           rtl: true,
        //           width: MediaQuery.of(context).size.width * 0.95,
        //           textController: textEditingController,
        //           onSuffixTap: null,
        //           closeSearchOnSuffixTap: true,
        //           onSubmitted: (String value) async {
        //             // cityName = value;
        //           },
        //         ))
        //   ],
        // ),
        body: RefreshIndicator(
      onRefresh: getData,
      child: FutureBuilder(
        future: getData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: [
                Container(
                  child: cityHeader(
                    '${weatherData?.cName}',
                    '${weatherData?.temp}',
                    '${weatherData?.icon}',
                    '${weatherData?.main}',
                    '${weatherData?.feelLike}',
                    '${weatherData?.description}',
                    '$date',

                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  child: currentWeatherDetails(
                    '${weatherData?.windSpeed}',
                    '${weatherData?.cloudAll}',
                    '${weatherData?.humidity}',
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 16.0),
                    child: const Text(
                      "Details",
                      style: TextStyle(fontSize: 28),
                    )),
                const SizedBox(height: 20),
                SizedBox(
                    height: 180,
                    width: MediaQuery.of(context).size.width - 125,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        weatherDetails(
                          '${weatherData?.minTemp}',
                          '${weatherData?.maxTemp}',
                          '${sunData?.sunRise}',
                          '${sunData?.sunSet}',
                        ),
                      ],
                    ))
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    ));
  }
}
