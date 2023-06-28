//yo page ma getLocationData wala matrai function xa

import 'package:clima/constants.dart';

import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    Future getLocationData() async {
      Location locs = Location();
      List<double> list = await locs.getCurrentLocation();
      double longii = list[1];
      double latti = list[0];

      NetworkHelper networkHelper = NetworkHelper(
          url:
              'https://api.openweathermap.org/data/2.5/weather?lat=$latti&lon=$longii&appid=$appId&units=metric');

      var weatherData = await networkHelper.getData();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => LocationScreen(
                    locationWeather: weatherData,
                  )));
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/city_background.jpg"),
                fit: BoxFit.cover)),
        child: Center(
            child: Column(
          children: [
            SpinKitCircle(
              color: Colors.red,
              size: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  getLocationData();
                },
                child: const Text('Get Location')),
          ],
        )),
      ),
    );
  }
}
