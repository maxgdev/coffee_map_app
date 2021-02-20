import 'package:location/location.dart';
import './location_model.dart';
import 'package:flutter/services.dart';

// class LocationApi {

//   Location _location = Location(); // defined in location.dart
//   String error;

//   static LocationApi _instance;
//   static LocationApi getInstance() => _instance ??= LocationApi(); // Ensure single instance ONLY-singleton

//   Future<LocationModel> getLocation() async {

//     Map<String, double> location;

//     try {
//       location = await _location.getLocation();
//       error = null;
//     } on PlatformException catch (e) {
//       if(e.code == 'PERMISSION_DENIED') {
//         error = 'Permission denied';
//       } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
//         error = 'Permission denied - please ask user to enable it from the app settings';
//       }
//       location = null;
//     }
//     return LocationModel.locationItems(location);
//   }
// }

class LocationApi {
  LocationModel _currentLocation;
  var location = Location();
  Future<LocationModel> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = LocationModel(
        userLocation.latitude,
        userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }
    print(_currentLocation.lat);
    print(_currentLocation.lon);
    return _currentLocation;
  }
}
