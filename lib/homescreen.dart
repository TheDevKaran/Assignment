// import 'package:flutter/material.dart';
// import 'package:weather/weather.dart';
// import 'package:intl/intl.dart';
//
// class Homescreen extends StatefulWidget {
//   final String city;
//   const Homescreen({super.key, required this.city});
//
//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }
//
// class _HomescreenState extends State<Homescreen> {
//   final WeatherFactory _wf = WeatherFactory('1953b515f04d1c8c8f8754895975dddf');
//   Weather? _weather;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchweather(widget.city);
//   }
//
//   Future<void> _fetchweather(String cityname) async {
//     try {
//       Weather weather = await _wf.currentWeatherByCityName(cityname);
//       setState(() {
//         _weather = weather;
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Not found')));
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Container(
//             height: 150,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.deepPurple[400],
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//               boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black)],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: const Text(
//                 'Weather App',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           if (_weather != null) ...[
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           Icons.location_on_outlined,
//                           size: 40,
//                         ),
//                         Text(
//                           _weather!.areaName!,
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             '${_weather!.temperature!.celsius!.toStringAsFixed(0)} °C',
//                             style: TextStyle(
//                               fontSize: width * 0.22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: width * 0.35,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(
//                             'http://openweathermap.org/img/wn/${_weather!.weatherIcon}@4x.png',
//                           ),
//                         ),
//                       ),
//                     ),
//                     Text(
//                       _weather!.weatherDescription!,
//                       style: TextStyle(
//                         fontSize: width * 0.05,
//                         overflow: TextOverflow.fade,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Card(
//                       shadowColor: Colors.black,
//                       color: Color.fromARGB(255, 33, 240, 243),
//                       child: SizedBox(
//                         height: 200,
//                         width: double.infinity,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   DateFormat('h:mm a').format(_weather!.date!),
//                                   style: const TextStyle(
//                                     fontSize: 35,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   DateFormat('M.d.y').format(_weather!.date!),
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//
// //                             Row(
// //                               mainAxisA],
//                             ),lignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Icon(Icons.thermostat, size: 24),
//                                 Text(
//                                   'Max: ${_weather!.tempMax!.celsius!.toStringAsFixed(0)} °C',
//                                   style: const TextStyle(fontSize: 20),
//                                 ),
//                                 Icon(Icons.thermostat_outlined, size: 24),
//                                 Text(
//                                   'Min: ${_weather!.tempMin!.celsius!.toStringAsFixed(0)} °C',
//                                   style: const TextStyle(fontSize: 20),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Icon(Icons.air, size: 24),
//                                 Text(
//                                   'Wind: ${_weather!.windSpeed!.toStringAsFixed(0)} m/s',
//                                   style: const TextStyle(fontSize: 20),
//                                 ),
//                                 Icon(Icons.opacity, size: 24),
//                                 Text(
//                                   'Humidity: ${_weather!.humidity!.toStringAsFixed(0)} %',
//                                   style: const TextStyle(fontSize: 20),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ]
//           else ...[
//             Center(
//               child: CircularProgressIndicator(),
//             )
//           ]
//         ]),
//       ),
//     );
//   }
// }
