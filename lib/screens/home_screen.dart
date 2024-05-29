import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task/screens/weather_screen.dart';

import '../controller/controller.dart';

class HomeScreen extends StatelessWidget {
  final weatherController = Get.put(WeatherController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: weatherController.textController,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter city name',

                ),
                onChanged: (city) => weatherController.fetchWeather(city),
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.to(WeatherScreen()),
              child: Text('Show Weather'),
            ),
          ],
        ),
      ),
    );
  }
}

