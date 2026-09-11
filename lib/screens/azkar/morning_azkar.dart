import 'package:flutter/material.dart';
import 'package:islamic_app/color.dart';

class MorningAzkarScreen extends StatelessWidget {
  const MorningAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> azkar = [
      'سبحان الله',
      'الحمد لله',
      'الله أكبر',
      'لا إله إلا الله',
      'أستغفر الله',
      'سبحان الله وبحمده',
      'سبحان الله العظيم',
      'لا حول ولا قوة إلا بالله',
      'اللهم صل وسلم على نبينا محمد',
      'لا إله إلا أنت سبحانك إني كنت من الظالمين',
    ];

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: const Text(
          'Morning Azkar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: azkar.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Text(
              azkar[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
