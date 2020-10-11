import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/helpers/constants.dart';
import 'package:weather_app/models/weatherModel.dart';

Future<WeatherModel> getWeather({place}) async{
  String url="http://api.openweathermap.org/data/2.5/weather?q=$place&appid="+WEATHER_API_KEY;
  Response response = await get(url);
  Map result = jsonDecode(response.body);
  WeatherModel baseModel = WeatherModel(name: result["name"],main: result["weather"][0]["main"],Description: result["weather"][0]["description"],temprature: result["main"]["temp"].toString(),Pressure: result["main"]["pressure"].toString(),Humidity: result["main"]["humidity"].toString(),Wind_Speed: result["wind"]["speed"].toString());
  print(result);
  return baseModel;
}

Future<WeatherModel> getWeatherByLatLng() async {
  LocationPermission permission = await requestPermission();
  Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  String url="http://api.openweathermap.org/data/2.5/weather?lat=${position.latitude.toString()}&lon=${position.longitude.toString()}&appid="+WEATHER_API_KEY;
  Response response = await get(url);
  Map result = jsonDecode(response.body);
  WeatherModel baseModel = WeatherModel(name: result["name"],main: result["weather"][0]["main"],Description: result["weather"][0]["description"],temprature: result["main"]["temp"].toString(),Pressure: result["main"]["pressure"].toString(),Humidity: result["main"]["humidity"].toString(),Wind_Speed: result["wind"]["speed"].toString());
  return baseModel;
}