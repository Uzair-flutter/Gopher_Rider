import 'package:flutter/material.dart';

class AddressModel {
  final String id;
  final String title;
  final String fullAddress;
  final String street;
  final String landmark;
  final String? floor;
  final bool isSelected;

  AddressModel({
    required this.id,
    required this.title,
    required this.fullAddress,
    required this.street,
    required this.landmark,
    this.floor,
    this.isSelected = false,
  });

  AddressModel copyWith({
    String? id,
    String? title,
    String? fullAddress,
    String? street,
    String? landmark,
    String? floor,
    bool? isSelected,
  }) {
    return AddressModel(
      id: id ?? this.id,
      title: title ?? this.title,
      fullAddress: fullAddress ?? this.fullAddress,
      street: street ?? this.street,
      landmark: landmark ?? this.landmark,
      floor: floor ?? this.floor,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class AddressProvider extends ChangeNotifier {
  List<AddressModel> _addresses = [
    AddressModel(
      id: '1',
      title: 'Home 1',
      fullAddress: '1234 Elm Street -Apt 56, Springfield, IL 62701',
      street: 'Elm Street',
      landmark: 'Near Central Park',
      floor: 'Floor 1',
      isSelected: false,
    ),
  ];

  List<AddressModel> get addresses => _addresses;

  AddressModel? get selectedAddress =>
      _addresses.firstWhere((addr) => addr.isSelected);

  void addAddress(AddressModel address) {
    _addresses.add(address);
    notifyListeners();
  }

  void selectAddress(String id) {
    _addresses = _addresses.map((addr) {
      return addr.copyWith(isSelected: addr.id == id);
    }).toList();
    notifyListeners();
  }

  void removeAddress(String id) {
    _addresses.removeWhere((addr) => addr.id == id);
    notifyListeners();
  }
}
