import 'package:flutter/material.dart';

import '../models/ui/service_model.dart';
import '../utils/assets.dart';

class ProfessionalGopherViewModel extends ChangeNotifier {
  // Available services list
  final List<PGService> _availableServices = [
    PGService(
      id: '1',
      name: 'House Cleaning',
      icon: DummyAssets.job,
      price: '25',
    ),
    PGService(id: '2', name: 'Laundry', icon: DummyAssets.job, price: '15'),
    PGService(id: '3', name: 'Pet Groomer', icon: DummyAssets.job, price: '20'),
    PGService(
      id: '4',
      name: 'Personal Help',
      icon: DummyAssets.job,
      price: '18',
    ),
    PGService(
      id: '5',
      name: 'Plumber Worker',
      icon: DummyAssets.job,
      price: '30',
    ),
    PGService(
      id: '6',
      name: 'Gardening Service',
      icon: DummyAssets.job,
      price: '22',
    ),
  ];
  final List<String> bookingSharePics = [];

  // Selected services
  final List<PGService> _selectedServices = [];

  // Search controller
  final TextEditingController searchController = TextEditingController();

  // Getters
  List<PGService> get availableServices => _availableServices;
  List<PGService> get selectedServices => _selectedServices;

  // Search functionality
  List<PGService> get filteredServices {
    if (searchController.text.isEmpty) {
      return _availableServices;
    }
    return _availableServices
        .where(
          (service) => service.name.toLowerCase().contains(
            searchController.text.toLowerCase(),
          ),
        )
        .toList();
  }

  // Toggle service selection
  void toggleService(PGService service) {
    service.isSelected = !service.isSelected;

    if (service.isSelected) {
      _selectedServices.add(service);
    } else {
      _selectedServices.removeWhere((s) => s.id == service.id);
    }
    notifyListeners();
  }

  // Add selected services
  void addSelectedServices() {
    notifyListeners();
  }

  // Remove service
  void removeService(String serviceId) {
    _selectedServices.removeWhere((service) => service.id == serviceId);

    // Also uncheck in available services
    final index = _availableServices.indexWhere((s) => s.id == serviceId);
    if (index != -1) {
      _availableServices[index].isSelected = false;
    }

    notifyListeners();
  }

  // Clear search
  void clearSearch() {
    searchController.clear();
    notifyListeners();
  }

  void addImage(String newImagePath) {
    if (!bookingSharePics.contains(newImagePath)) {
      bookingSharePics.add(newImagePath);
    }
    notifyListeners();
  }

  void removeImage(int index) {
    if (index >= 0 && index < bookingSharePics.length) {
      bookingSharePics.removeAt(index);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
