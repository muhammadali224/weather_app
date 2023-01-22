import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherService extends GetxController {
  final RxList<Weather> taskList = <Weather>[].obs;
  static const String _appID = '0f2154c2c523e55e85474c3760a03f5e';

  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;

  RxDouble getLatitude() => _latitude;

  RxDouble getLongitude() => _longitude;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  Future<Weather> getWeatherCurrentLocation(String? lati, String? long) async {
    var httpsUri = Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: '/data/2.5/forecast',
        queryParameters: {
          'lat': lati,
          'lon': long,
          'appid': _appID,
          'units': 'metric',
          'lang': 'ar'
        });

    final http.Response response = await http.get(httpsUri);
    var body = jsonDecode(response.body);
    return Weather.fromJsonCurrent(body);
  }
  Future<Weather> getWeatherCityLocation(String? cName) async {
    var httpsUri = Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: '/data/2.5/forecast',
        queryParameters: {
          'q':cName,
          'appid': _appID,
          'units': 'metric',
          'lang': 'ar'
        });



    final http.Response response = await http.get(httpsUri);
    var body = jsonDecode(response.body);
    return Weather.fromJsonCurrent(body);
  }

  Future<Sun> getSun(String? lati, String? long) async {
    var httpsUri = Uri(
        scheme: 'https',
        host: 'api.ipgeolocation.io',
        path: 'astronomy',
        queryParameters: {
          'apiKey': '1092167f5275416089375ad1f1841d87',
          'lat': lati,
          'long': long,
        });

    final http.Response response = await http.get(httpsUri);
    var body = jsonDecode(response.body);
    return Sun.fromJson(body);
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error("Location is not enabled.");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission denied forever.");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission denied.");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      _isLoading.value = false;
    });
  }
}
