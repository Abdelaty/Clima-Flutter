import 'location.dart';
import 'networking.dart';

const appID = '5d44458d622bf5dead8f71b6fdddb6cd';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    LocationController location = LocationController();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL lat=${location.latitude}&lon=${location.longitude}&appid=$appID&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL q=$cityName&appid=$appID&units=metric';
    LocationController location = LocationController();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
