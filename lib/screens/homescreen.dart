import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import '../widgets/weather_details.dart';

class Homescreen extends StatefulWidget {
  final String city;
  const Homescreen({Key? key, required this.city}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final WeatherFactory _wf = WeatherFactory('4301cb9c9b671b7e588fd19e0b7b2adc');
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _fetchweather(widget.city);
  }

  Future<void> _fetchweather(String cityname) async {
    setState(() {
      _weather = null; // Reset weather to null to show CircularProgressIndicator
    });

    try {
      Weather weather = await _wf.currentWeatherByCityName(cityname);
      setState(() {
        _weather = weather; // Update weather details once fetched
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('City not found')),
      );
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.deepPurple[400],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black)],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Weather App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          ElevatedButton(
            onPressed: () => _fetchweather(widget.city),
            child: const Text('Refresh'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple[400],
            ),
          ),
          if (_weather != null)
            WeatherDetails(weather: _weather!, width: width)
          else
            const Center(
              child: CircularProgressIndicator(),
            ),
        ]),
      ),
    );
  }
}
