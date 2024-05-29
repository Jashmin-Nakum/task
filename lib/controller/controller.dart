import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weather/weather.dart';

class WeatherController extends GetxController {
  var weatherData = Rx<Weather?>(null); // Observable weather data
  var isLoading = false.obs; // Observable loading state
  RxString city = ''.obs;
  final textController = TextEditingController();

  late WeatherFactory weatherFactory; // Declare WeatherFactory

  // Constructor to initialize WeatherFactory with API key
  WeatherController() {
    weatherFactory = WeatherFactory('7ac9b7ad5be56b0b75ce58992bd743e8');
  }
  @override
  void onReady() {
    super.onReady();
    fetchWeather(textController.text);
  }
  // Method to fetch weather data
  Future<void> fetchWeather(String city) async {
    isLoading.value = true;
    try {
      final response = await weatherFactory.currentWeatherByCityName(city);
      print('API Response: $response');
      if (response != null) {
        weatherData.value = response;
      }
    } on DioError catch (error) {
      print(error.message); // Handle API errors (e.g., network issues, invalid city)
      // Show user-friendly error message
    } finally {
      isLoading.value = false;
    }
  }
}
