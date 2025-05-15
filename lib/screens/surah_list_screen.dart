import 'package:flutter/material.dart';
import 'package:quran_flutter/quran_flutter.dart';
import 'package:myapp/screens/surah_display_screen.dart';

class SurahListScreen extends StatefulWidget {
  const SurahListScreen({super.key});

  @override
  State<SurahListScreen> createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  late List<Map<String, dynamic>> _surahDetails;

  @override
  void initState() {
    super.initState();
    _surahDetails = [];
    int totalSurahs = Quran.surahCount;

    for (int i = 1; i <= totalSurahs; i++) {
      String englishName = Quran.getSurahNameEnglish(i);
      SurahType surahType = Quran.getSurahType(i);
      int numberOfAyahs = Quran.getTotalVersesInSurah(i);
      String surahName = Quran.getSurahName(i); // Assuming getSurahName exists for Arabic/original name

      _surahDetails.add({
        'number': i,
        'name': surahName,
        'englishName': englishName,
        'revelationType': surahType.toString().split('.').last, // Get enum name as string
        'numberOfAyahs': numberOfAyahs,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran App - Surahs'),
      ),
      body: ListView.builder(
        itemCount: _surahDetails.length,
        itemBuilder: (context, index) {
          final surah = _surahDetails[index];
          final int surahNumber = surah['number'];
          final String surahName = surah['name'];
          final String englishName = surah['englishName'];
          final String revelationType = surah['revelationType'];
          final int numberOfAyahs = surah['numberOfAyahs'];

          return ListTile(
            leading: CircleAvatar(
              child: Text(surahNumber.toString()),
            ),
            title: Text('$surahName ($englishName)'),
            subtitle: Text('$revelationType - $numberOfAyahs Ayahs'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SurahDisplayScreen(surahNumber: surahNumber),
                ),
              );
            },
          );
        },
      ),
    );
  }
}