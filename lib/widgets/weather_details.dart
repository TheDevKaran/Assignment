import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

/// A widget to display detailed weather information
class WeatherDetails extends StatelessWidget {
  final Weather weather;
  final double width;

  const WeatherDetails({
    Key? key,
    required this.weather,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 40,
                ),
                Text(
                  weather.areaName!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weather.temperature!.celsius!.toStringAsFixed(0)} °C',
                    style: TextStyle(
                      fontSize: width * 0.22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: width * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'http://openweathermap.org/img/wn/${weather.weatherIcon}@4x.png',
                  ),
                ),
              ),
            ),
            Text(
              weather.weatherDescription!,
              style: TextStyle(
                fontSize: width * 0.05,
                overflow: TextOverflow.fade,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shadowColor: Colors.black,
              color: const Color.fromARGB(255, 33, 240, 243),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          DateFormat('h:mm a').format(weather.date!),
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('M.d.y').format(weather.date!),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.thermostat, size: 24),
                        Text(
                          'Max: ${weather.tempMax!.celsius!.toStringAsFixed(0)} °C',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Icon(Icons.thermostat_outlined, size: 24),
                        Text(
                          'Min: ${weather.tempMin!.celsius!.toStringAsFixed(0)} °C',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.air, size: 24),
                        Text(
                          'Wind: ${weather.windSpeed!.toStringAsFixed(0)} m/s',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Icon(Icons.opacity, size: 24),
                        Text(
                          'Humidity: ${weather.humidity!.toStringAsFixed(0)} %',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
