import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherController = Get.find<WeatherController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Obx(
            () => weatherController.isLoading.value
            ? CircularProgressIndicator()
            : weatherController.weatherData.value == null
            ? Text('No weather data available')
            : Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${weatherController.weatherData.value!.temperature}°C',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('${weatherController.weatherData.value!.humidity}% humidity'),
                  SizedBox(height: 8),
                  Text('${weatherController.weatherData.value!.areaName}'),
                  SizedBox(height: 8),
                  Text('${weatherController.weatherData.value!.country}'),
                  SizedBox(height: 8),
                  Text('${weatherController.weatherData.value!.cloudiness}% cloudiness'),
                  SizedBox(height: 8),
                  Text('${weatherController.weatherData.value!.date}'),
                  SizedBox(height: 8),
                  Text('${weatherController.weatherData.value!.windSpeed} m/s wind speed'),
                  SizedBox(height: 8),
                  Text('${weatherController.weatherData.value!.weatherDescription}'),
                  // Display other weather data as needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}