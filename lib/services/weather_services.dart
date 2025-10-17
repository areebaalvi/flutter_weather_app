
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class WeatherServices {
  final String apiKey = 'b516617a11a4ce549daddc811e4f6ac5';

  Future<Weather> fetchWeather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Weather.fromJson(jsonData);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
