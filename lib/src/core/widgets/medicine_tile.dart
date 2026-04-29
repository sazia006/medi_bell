import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/medicine_model.dart';
import '../providers/medicine_provider.dart';

class MedicineTile extends StatelessWidget {
  final Medicine medicine;
  const MedicineTile(this.medicine, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: medicine.imagePath.isNotEmpty
          ? Image.file(
              File(medicine.imagePath),
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            )
          : const Icon(Icons.medication, size: 50),
      title: Text(
        medicine.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(medicine.time, style: const TextStyle(fontSize: 16)),
      trailing: Checkbox(
        value: medicine.taken,
        onChanged: (_) {
          Provider.of<MedicineProvider>(
            context,
            listen: false,
          ).toggleTakenStatus(medicine.id);
        },
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
  }
}
