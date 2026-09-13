import 'package:flutter/material.dart';
import 'package:islamic_app/color.dart';
import 'package:islamic_app/widgets/tasbih_widget.dart';
import 'package:islamic_app/services/tasbih_storage_service.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    loadCount();
  }

  Future<void> loadCount() async {
    final savedCount =
        await LocalStorageService.getTasbihCount();

    setState(() {
      count = savedCount;
    });
  }

  Future<void> increaseCount() async {
    setState(() {
      count++;
    });

    await LocalStorageService.saveTasbihCount(count);
  }

  Future<void> resetCount() async {
    setState(() {
      count = 0;
    });

    await LocalStorageService.saveTasbihCount(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,

      appBar: AppBar(
        backgroundColor: AppColors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Tasbih',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  width: 150,
                  height: 150,

                  child: Stack(
                    alignment: Alignment.center,

                    children: [
                      CircularProgressIndicator(
                        value: count / 33,
                        strokeWidth: 150,
                        backgroundColor: Colors.white,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(
                          AppColors.gold,
                        ),
                      ),

                      Text(
                        '$count',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 50),

            Center(
              child: Text(
                'سُبْحَانَ اللّٰهِ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 50),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,

              children: [
                TasbihWidget(
                  tasbih: 'Reset',
                  onPressed: resetCount,
                ),

                TasbihWidget(
                  tasbih: '+',
                  onPressed: increaseCount,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}