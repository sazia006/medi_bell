import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medi_bell/src/core/models/medicine_model.dart';
import 'package:medi_bell/src/core/providers/medicine_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddMedicineScreen extends StatefulWidget {
  static const routeName = '/add-medicine';
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _nameController = TextEditingController();
  final _timeController = TextEditingController();
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _saveMedicine() {
    if (_nameController.text.isEmpty ||
        _timeController.text.isEmpty ||
        _imageFile == null)
      return;

    final newMedicine = Medicine(
      id: const Uuid().v4(),
      name: _nameController.text,
      time: _timeController.text,
      imagePath: _imageFile!.path,
    );

    Provider.of<MedicineProvider>(
      context,
      listen: false,
    ).addMedicine(newMedicine);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Medicine')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Medicine Name'),
            ),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(
                labelText: 'Time (e.g., 08:00 AM)',
              ),
            ),
            const SizedBox(height: 20),
            _imageFile == null
                ? const Text('No image selected')
                : Image.file(_imageFile!, height: 150),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.image),
              label: const Text('Pick Medicine Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveMedicine, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
