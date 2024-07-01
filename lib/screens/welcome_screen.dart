import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homescreen.dart';

class GetStarted extends StatefulWidget {
  GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  String? _lastSearchedCity;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLastCity();
  }

  Future<void> _loadLastCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastSearchedCity = prefs.getString('lastCity');
    });
  }

  Future<void> _saveLastCity(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastCity', city);
    setState(() {
      _lastSearchedCity = city;
    });
  }

  void _onSearchSubmitted(String city) async {
    if (city.isNotEmpty) {
      await _saveLastCity(city);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Homescreen(city: city),
        ),
      ).then((_) {
        _searchController.clear();
        setState(() {});
      });
    }
  }

  void _onLastSearchedPressed() {
    if (_lastSearchedCity != null) {
      _searchController.text = _lastSearchedCity!;
      _onSearchSubmitted(_lastSearchedCity!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Lottie.asset('assets/images/animation.json'),
              ),
              SizedBox(height: 20),
              Text(
                'Check real-time Weather!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Enter city name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  ),
                ),
                onSubmitted: _onSearchSubmitted,
              ),
              SizedBox(height: 10,),
              if (_lastSearchedCity != null && _searchController.text.isEmpty)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0), // Adjust spacing as needed
                        child: ElevatedButton(
                          onPressed: _onLastSearchedPressed,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.grey[300], // Change color as needed
                            backgroundColor: Colors.deepPurple, // Change color as needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            _lastSearchedCity!,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _onSearchSubmitted(_searchController.text),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Search', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
