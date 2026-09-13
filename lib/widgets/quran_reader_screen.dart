import 'package:flutter/material.dart';
import 'package:quran_pages_with_ayah_detector/quran_pages_with_ayah_detector.dart';

class QuranReaderScreen extends StatelessWidget {
  const QuranReaderScreen({
    super.key,
    required this.surahName,
    required this.pageNumber,
  });

  final String surahName;
  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,

        title: Text(
          surahName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,

        child: QuranPageView(
          pageImagePath: 'assets/pages/',
        ),
      ),
    );
  }
}

