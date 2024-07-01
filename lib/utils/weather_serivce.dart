import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';

class WeatherApiService extends ChangeNotifier {
  final WeatherFactory _wf = WeatherFactory('1953b515f04d1c8c8f8754895975dddf');
  Weather? _weather;
  String? _errorMessage;

  Weather? get weather => _weather;
  String? get errorMessage => _errorMessage;

  Future<void> getWeatherData(String cityName) async {
    try {
      Weather weather = await _wf.currentWeatherByCityName(cityName);
      _weather = weather;
      _errorMessage = null;
      await _saveLastCity(cityName);
    } catch (e) {
      _errorMessage = 'Failed to load weather data: $e';
      _weather = null;
    }
    notifyListeners();
  }

  Future<void> _saveLastCity(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastCity', cityName);
  }

  Future<String?> getLastCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastCity');
  }

  Future<void> fetchLastCityWeather() async {
    String? lastCity = await getLastCity();
    if (lastCity != null) {
      await getWeatherData(lastCity);
    }
  }
}