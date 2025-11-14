import 'package:flutter/foundation.dart';

import '../utils/enums.dart';

class ServiceViewModel extends ChangeNotifier {
  GopherType? selectedGopherType;
  int? selectedDeliveryWeight;
  final List<DeliveryCategory> categories = [];

  void setGopherType(GopherType newGopherType) {
    selectedGopherType = newGopherType;
    notifyListeners();
  }

  void setDeliveryWeight(int newDeliveryWeight) {
    selectedDeliveryWeight = newDeliveryWeight;
    notifyListeners();
  }

  void setCategory(DeliveryCategory newCategory) {
    if (categories.contains(newCategory)) {
      categories.remove(newCategory);
    } else {
      categories.add(newCategory);
    }
    notifyListeners();
  }
}
