class Weather {
  String? main;
  String? description;
  String? icon;
  double? temp;
  double? feelLike;
  double? minTemp;
  double? maxTemp;
  double? windSpeed;
  int? cloudAll;
  int? humidity;
  String? country;
  String? cName;

  Weather(
      {required this.main,
      required this.description,
      required this.icon,
      required this.temp,
      required this.feelLike,
      required this.minTemp,
      required this.maxTemp,
      required this.windSpeed,
      required this.humidity,
      required this.cloudAll,
      required this.country,
      required this.cName,});

  // factory Weather.fromJson(dynamic json) {
  //   return Weather(
  //     main: json['weather'][0]['main'].toString(),
  //     description: json['weather'][0]['description'].toString(),
  //     icon: json['weather'][0]['icon'].toString(),
  //     temp: json['main']['temp'],
  //     feelLike: json['main']['feels_like'],
  //     minTemp: json['main']['temp_min'],
  //     maxTemp: json['main']['temp_max'],
  //     windSpeed: json['wind']['speed'],
  //     cloudAll: json['clouds']['all'],
  //     sunriseTime: json['sys']['sunrise'],
  //     sunsetTime: json['sys']['sunset'],
  //     country: json['sys']['country'].toString(),
  //     cName: json['name'].toString(),
  //   );
  //
  // }

  Weather.fromJson(dynamic json) {
    main = json['weather'][0]['main'].toString();
    description = json['weather'][0]['description'].toString();
    icon = json['weather'][0]['icon'].toString();
    temp = json['main']['temp'];
    feelLike = json['main']['feels_like'];
    minTemp = json['main']['temp_min'];
    humidity = json['main']['humidity'];
    maxTemp = json['main']['temp_max'];
    windSpeed = json['wind']['speed'];
    cloudAll = json['clouds']['all'];
    country = json['sys']['country'].toString();
    cName = json['name'].toString();
  }

  @override
  String toString() {
    return '''
    main : $main
    description: $description
    icon: $icon
    temp: $temp
    feelLike: $feelLike
    minTemp: $minTemp
    maxTemp: $maxTemp
    humidity : $humidity
    windSpeed: $windSpeed
    cloudAll: $cloudAll
    country: $country
    cName: $cName
    ''';
  }
}

class Sun{
String? sunRise;
String? sunSet;

Sun({this.sunRise, this.sunSet});
Sun.fromJson(dynamic json){
  sunRise=json['sunrise'];
  sunSet=json['sunset'];

}

}
