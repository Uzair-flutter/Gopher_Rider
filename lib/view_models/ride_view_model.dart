import 'package:flutter/material.dart';
import 'package:gophar_rider/utils/assets.dart';

import '../widgets/bottomSheet/add_items_bottom_sheet.dart';

class RideViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> rides = [];
  List<Item> _items = [];

  // TextEditingControllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  List<Item> get items => _items;

  void setRideList() {
    rides = [
      {
        "id": "ride_1",
        "riderName": "Christopher Smith",
        "riderImage": DummyAssets.person,
        "rating": 4.4,
        "price": 13.99,
        "time": "4 mins",
        "distance": "2.5 miles away",
      },
      {
        "id": "ride_2",
        "riderName": "Emily Johnson",
        "riderImage": DummyAssets.person,
        "rating": 4.7,
        "price": 15.49,
        "time": "6 mins",
        "distance": "3.2 miles away",
      },
      {
        "id": "ride_3",
        "riderName": "Michael Brown",
        "riderImage": DummyAssets.person,
        "rating": 4.5,
        "price": 12.75,
        "time": "5 mins",
        "distance": "1.8 miles away",
      },
    ];
    notifyListeners();
  }

  void declineRide(String rideId) {
    rides.removeWhere((ride) => ride["id"] == rideId);
    notifyListeners();
  }

  void addItem(String name, String price) {
    _items.add(Item(name: name, price: price));
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearItems() {
    _items.clear();
    notifyListeners();
  }

  void clearControllers() {
    nameController.clear();
    priceController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
