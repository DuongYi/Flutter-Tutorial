import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart';
import '../helpers/db_helper.dart';
import '../helpers/location_helper.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((place) => place.id == id);
  }

  Future<void> addPlace(
    String pickedTitle,
    File pickedImage,
    PlaceLocation pickedLocation,
  ) async {
    final address = await LocationHelper.getPlaceAddress(
      pickedLocation.latitude,
      pickedLocation.longitude,
    );
    final updatedLocation = PlaceLocation(
      latitude: pickedLocation.latitude,
      longitude: pickedLocation.longitude,
      address: address,
    );
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      location: updatedLocation,
      title: pickedTitle,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
        'loc_lat': newPlace.location!.latitude,
        'loc_lng': newPlace.location!.longitude,
        'address': newPlace.location!.address as String,
      },
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items.clear();
    for (var data in dataList) {
      _items.add(
        Place(
          id: data['id'],
          title: data['title'],
          location: PlaceLocation(
            latitude: data['loc_lat'],
            longitude: data['loc_lng'],
            address: data['address'],
          ),
          image: File(data['image']),
        ),
      );
    }
    notifyListeners();
  }
}
