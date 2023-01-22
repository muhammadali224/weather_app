class Weather {
  String? main;
  String? description;
  String? icon;
  double? temp;
  double? feelLike;
  double? minTemp;
  double? maxTemp;
  double? windSpeed;
  double? lati;
  double? long;
  int? cloudAll;
  int? humidity;
  String? cName;
  List<dynamic>? dailyTempMax;
  List<dynamic>? dailyTempMin;
  List<String>? dailyIcon;
  List<String>? dailyDT;

  Weather({
    required this.main,
    required this.description,
    required this.icon,
    required this.temp,
    required this.feelLike,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
    required this.humidity,
    required this.cloudAll,
    required this.cName,
    required this.dailyTempMax,
    required this.dailyTempMin,
    required this.dailyIcon,
    required this.dailyDT,
    required this.long,
    required this.lati,
  });

  Weather.fromJsonCurrent(dynamic json) {
    main = json['list'][0]['weather'][0]['main'].toString();
    description = json['list'][0]['weather'][0]['description'].toString();
    icon = json['list'][0]['weather'][0]['icon'].toString();
    temp = json['list'][0]['main']['temp'];
    feelLike = json['list'][0]['main']['feels_like'];
    minTemp = json['list'][0]['main']['temp_min'];
    humidity = json['list'][0]['main']['humidity'];
    maxTemp = json['list'][0]['main']['temp_max'];
    lati = json['city']['coord']['lat'];
    long = json['city']['coord']['lon'];
    windSpeed = json['list'][0]['wind']['speed'];
    cloudAll = json['list'][0]['clouds']['all'];
    cName = json['city']['name'];
    dailyDT = [
      json['list'][11]['dt'].toString(),
      json['list'][19]['dt'].toString(),
      json['list'][27]['dt'].toString(),
      json['list'][35]['dt'].toString(),
    ];
    dailyTempMax = [
      (json['list'][11]['main']['temp_max']).ceil(),
      (json['list'][19]['main']['temp_max']).ceil(),
      (json['list'][27]['main']['temp_max']).ceil(),
      (json['list'][35]['main']['temp_max']).ceil(),
    ];
    dailyTempMin = [
      (json['list'][15]['main']['temp_min']).floor(),
      (json['list'][23]['main']['temp_min']).floor(),
      (json['list'][31]['main']['temp_min']).floor(),
      (json['list'][39]['main']['temp_min']).floor(),
    ];
    dailyIcon = [
      json['list'][13]['weather'][0]['icon'],
      json['list'][21]['weather'][0]['icon'],
      json['list'][29]['weather'][0]['icon'],
      json['list'][37]['weather'][0]['icon'],
    ];
  }

  @override
  String toString() {
    return '''
   main: $main
   description: $description
   icon: $icon
   temp: $temp
   feelLike: $feelLike
   minTemp: $minTemp
   maxTemp: $maxTemp
   windSpeed: $windSpeed
   cloudAll: $cloudAll
   humidity: $humidity
   cName: $cName
   daily Date : $dailyDT
   daily min : $dailyTempMin
   daily max : $dailyTempMax
   daily icon :$dailyIcon
    ''';
  }
}

class Sun {
  String? sunRise;
  String? sunSet;

  Sun({this.sunRise, this.sunSet});

  Sun.fromJson(dynamic json) {
    sunRise = json['sunrise'];
    sunSet = json['sunset'];
  }
}
