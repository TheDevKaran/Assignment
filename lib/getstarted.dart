// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:weather_app/homescreen.dart';
//
// class GetStarted extends StatelessWidget {
//   GetStarted({Key? key}) : super(key: key);
//
//   final TextEditingController _cityController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 16, 125, 215),
//                     Color.fromARGB(255, 34, 227, 211),
//                     Colors.lightBlueAccent
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height * 0.5,
//                     width: double.infinity,
//                     child: Lottie.asset('assets/images/animation.json'),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.4,
//                     width: double.infinity,
//                     child: Container(
//                       padding: EdgeInsets.all(
//                           MediaQuery.of(context).size.width * 0.05),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: const [
//                           BoxShadow(color: Colors.black38, blurRadius: 20)
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'Check real-time',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 37,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const Text(
//                             'Weather!',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 37,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.01,
//                           ),
//                           const Text(
//                             'Check the weather of any city just in seconds. \n Try it',
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           TextField(
//                             controller: _cityController,
//                             decoration: InputDecoration(
//                               hintText: 'Enter city name',
//                               border: const OutlineInputBorder(
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(20)),
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           SizedBox(
//                             width: double.infinity,
//                             height: MediaQuery.of(context).size.height * 0.07,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 String city = _cityController.text;
//                                 if (city.isNotEmpty) {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           Homescreen(city: city),
//                                     ),
//                                   );
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                         content:
//                                         Text('Please enter a city name')),
//                                   );
//                                 }
//                               },
//                               style: ElevatedButton.styleFrom(
//                                   foregroundColor: Colors.deepPurple,
//                                   backgroundColor: Colors.deepPurple),
//                               child: const Text(
//                                 'Search',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 24,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
