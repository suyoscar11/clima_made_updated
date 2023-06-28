// import 'dart:io';

// void main() {
//   perforTasks();
// }

// void perforTasks() async {
//   task1();
//   String task2result = await task2();
//   task3(task2result);
// }

// void task1() {
//   String result = 'task1data';
//   print('TAsk1 complete');
// }

// Future task2() async {
//   String result = 'task2complete';
//   Duration tressecond = Duration(seconds: 3);
//   await Future.delayed(tressecond, () {
//     print('Task2complete');
//   });
//   return result;
// }

// void task3(String task2result) {
//   String result = 'task3complete';
//   print('Task 3 complete with $task2result');
// }

import 'package:geolocator/geolocator.dart';

class Location {
  double lattitudeeee = 0;
  double longitudeee = 0;
  Future<List<double>> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lattitudeeee = position.latitude;
      longitudeee = position.longitude;
      return [lattitudeeee, longitudeee];
    } catch (e) {
      print(e);
      throw Exception("Error");
    }
  }
}
