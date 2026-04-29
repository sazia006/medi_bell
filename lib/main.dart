import 'package:flutter/material.dart';
import 'package:medi_bell/src/core/providers/medicine_provider.dart';
import 'package:medi_bell/src/feature/pages/add_medicine/view/add_medicine.dart';
import 'package:medi_bell/src/feature/pages/home/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MedicineProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediBell',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomeScreen(),
      routes: {AddMedicineScreen.routeName: (_) => const AddMedicineScreen()},
    );
  }
}
