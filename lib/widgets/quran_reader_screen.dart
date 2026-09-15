import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranReaderScreen extends StatefulWidget {
  const QuranReaderScreen({
    super.key,
    required this.surahName,
    required this.pageNumber,
  });

  final String surahName;
  final int pageNumber;

  @override
  State<QuranReaderScreen> createState() => _QuranReaderScreenState();
}

class _QuranReaderScreenState extends State<QuranReaderScreen> {
  String content = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadQuranPage();
  }

  Future<void> loadQuranPage() async {
    try {
      String text = await rootBundle.loadString(
        'assets/files/${widget.pageNumber}.txt',
      );

      setState(() {
        content = text;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        content = 'error';
        isLoading = false;
      });

      debugPrint('Quran Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,

        title: Text(
          widget.surahName,
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

      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            )
          : Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    height: 2,
                  ),
                ),
              ),
            ),
    );
  }
}
