import 'package:flutter/material.dart';
import 'package:quran_flutter/quran_flutter.dart';
import 'package:myapp/screens/surah_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async main
  await Quran.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true, // Recommended for new Flutter apps
      ),
      home: const SurahListScreen(),
    );
  }
}
