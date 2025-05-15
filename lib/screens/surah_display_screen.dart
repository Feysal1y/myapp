import 'package:flutter/material.dart';
import 'package:quran_flutter/quran_flutter.dart';

class SurahDisplayScreen extends StatefulWidget {
  const SurahDisplayScreen({super.key, required this.surahNumber});

  final int surahNumber;

  @override
  State<SurahDisplayScreen> createState() => _SurahDisplayScreenState();
}

class _SurahDisplayScreenState extends State<SurahDisplayScreen> {
  late int _ayahCount;
  late List<Verse> _arabicVerses;
  late List<Verse> _englishVerses;

  @override
  void initState() {
    super.initState();
    _ayahCount = Quran.getTotalVersesInSurah(widget.surahNumber);
    // Fetch all verses for the surah in Arabic (default language)
    _arabicVerses = Quran.getQuranVerses()[widget.surahNumber]?.values.toList() ?? [];
    // Fetch all verses for the surah in English
    _englishVerses = Quran.getQuranVerses(language: QuranLanguage.english)[widget.surahNumber]?.values.toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah ${widget.surahNumber}'),
      ),
      body: ListView.builder(
        itemCount: _ayahCount,
        itemBuilder: (context, index) {
          final int ayahNumber = index + 1;
          // Ensure index is within bounds for both lists
          final String arabicAyah = index < _arabicVerses.length ? _arabicVerses[index].text : 'Error fetching Arabic verse';
          final String englishTranslation = index < _englishVerses.length ? _englishVerses[index].text : 'Error fetching English translation';

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '$ayahNumber. $arabicAyah',
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  englishTranslation,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 16),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}