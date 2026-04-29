import 'package:flutter/material.dart';
import '../models/medicine_model.dart';

class MedicineProvider with ChangeNotifier {
  List<Medicine> _medicines = [];

  List<Medicine> get medicines => _medicines;

  void addMedicine(Medicine medicine) {
    _medicines.add(medicine);
    notifyListeners();
  }

  void toggleTakenStatus(String id) {
    final index = _medicines.indexWhere((med) => med.id == id);
    if (index != -1) {
      _medicines[index].taken = !_medicines[index].taken;
      notifyListeners();
    }
  }

  void removeMedicine(String id) {
    _medicines.removeWhere((med) => med.id == id);
    notifyListeners();
  }
}
