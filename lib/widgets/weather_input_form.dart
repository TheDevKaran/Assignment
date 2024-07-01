import 'package:flutter/material.dart';

class WeatherInputForm extends StatelessWidget {
  final TextEditingController cityController;
  final Function(String) onSubmit;

  WeatherInputForm({required this.cityController, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Check real-time',
          style: TextStyle(
            color: Colors.black,
            fontSize: 37,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Weather!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 37,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const Text(
          'Check the weather of any city just in seconds. \n Try it',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        TextField(
          controller: cityController,
          decoration: InputDecoration(
            hintText: 'Enter city name',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.07,
          child: ElevatedButton(
            onPressed: () {
              String city = cityController.text;
              if (city.isNotEmpty) {
                onSubmit(city);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a city name')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.deepPurple,
              backgroundColor: Colors.deepPurple,
            ),
            child: const Text(
              'Search',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        )
      ],
    );
  }
}