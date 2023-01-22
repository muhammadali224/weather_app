

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/widget/current_weather.dart';
import 'package:weather_app/widget/details.dart';
import 'package:weather_app/widget/weather_forcast.dart';

import '../services/weather_service.dart';
import '../widget/city_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherService weatherService = Get.put(WeatherService(),permanent: true);
  String city = "";
  Weather? weatherData;
  Sun? sunData;


  Future<void> getData() async {
    city == ""
        ? weatherData = await weatherService.getWeatherCurrentLocation(
            weatherService.getLatitude().toString(),
            weatherService.getLongitude().toString())
        : weatherData = await weatherService.getWeatherCityLocation(city);
    sunData = await weatherService.getSun(
        weatherData?.lati.toString(),
        weatherData?.long.toString());
  }

  @override
  void initState()  {
    getData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 15),
            child: AnimSearchBar(
              helpText: "Search City ..",
              autoFocus: true,
              rtl: true,
              width: MediaQuery.of(context).size.width * 0.95,
              textController: textEditingController,
              onSuffixTap: null,
              closeSearchOnSuffixTap: true,
              onSubmitted: (String value) async {
                city = value;
                getData();
              },
            ),
          ),
        ],
        title: Text(
          city,
          style: const TextStyle(color: Colors.deepPurple, fontSize: 25),
        ),
      ),
      body: FutureBuilder(
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
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  child: currentWeatherDetails(
                    '${weatherData?.windSpeed}',
                    '${weatherData?.cloudAll}',
                    '${weatherData?.humidity}',
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                    child: Text("Details",
                        style: GoogleFonts.poppins(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ))),
                const SizedBox(height: 10),
                SizedBox(
                    height: 170,
                    width: MediaQuery.of(context).size.width - 15,
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
                    )),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 350,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Forecast for 4 days ",
                        style: GoogleFonts.poppins(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (BuildContext context, index) {
                              return daily(
                                "${weatherData?.dailyDT![index]}",
                                "${weatherData?.dailyIcon?[index]}",
                                "${weatherData?.dailyTempMax?[index]}",
                                "${weatherData?.dailyTempMin?[index]}",
                              );
                            }),
                      )
                    ],
                  ),
                ),
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
    );
  }
}
