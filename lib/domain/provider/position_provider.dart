import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class PositionProvider extends ChangeNotifier {
  Position? _location;
  String? _address;
  void saveLocation(Position location) {
    _location = location;
    _getAddressFromLatLng(location);

    notifyListeners();
  }

  Position? get location {
    return _location;
  }

  String? get address {
    return _address;
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      _address = "${place.street}, ${place.locality}, ${place.country}";
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
