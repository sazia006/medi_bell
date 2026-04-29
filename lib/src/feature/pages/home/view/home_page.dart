import 'package:flutter/material.dart';
import 'package:medi_bell/src/core/providers/medicine_provider.dart';
import 'package:medi_bell/src/core/widgets/custom_bottom_nav.dart';
import 'package:medi_bell/src/core/widgets/medicine_tile.dart';
import 'package:medi_bell/src/feature/pages/add_medicine/view/add_medicine.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onNavTap(int index) {
    if (index == 1) {
      Navigator.pushNamed(context, AddMedicineScreen.routeName);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final medicines = Provider.of<MedicineProvider>(context).medicines;

    return Scaffold(
      appBar: AppBar(title: const Text('MediBell')),
      body: medicines.isEmpty
          ? const Center(child: Text('No medicines added yet!'))
          : ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (ctx, i) => MedicineTile(medicines[i]),
            ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
