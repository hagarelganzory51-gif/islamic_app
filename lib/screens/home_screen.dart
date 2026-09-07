import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/color.dart';
import 'package:islamic_app/widgets/payerrow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.black,
      appBar: AppBar(
         backgroundColor:AppColors.black,
      ),
      body:Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prayer Times',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(children: [
              Text(
              'Today :',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Text(
              DateFormat('EEEE, MMMM d, y').format(DateTime.now()),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
            ],),
            SizedBox(height: 16),
          

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 40,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                     PrayerRow(
                        icon: Icons.wb_sunny_outlined,
                        name: 'Fajr',
                        time: '04:20 AM',
                        notification: false,
                      ),
                      SizedBox(height: 10),
                      PrayerRow(
                        icon: Icons.wb_sunny,
                        name: 'Sunrise',
                        time: '05:50 AM',
                        notification: false,
                      ),
                      SizedBox(height: 10),
                      PrayerRow(
                        icon: Icons.wb_sunny_outlined,
                        name: 'Dhuhr',
                        time: '12:00 PM',
                        notification: false,
                      ),
                      SizedBox(height: 10),
                      PrayerRow(
                        icon: Icons.wb_sunny_outlined,
                        name: 'Asr',
                        time: '03:25 PM',
                        notification: false,
                      ),
                      SizedBox(height: 10), 
                      PrayerRow(
                        icon: Icons.wb_sunny_outlined,
                        name: 'Maghrib',
                        time: '06:35 PM',
                        notification: false,
                      ),
                      SizedBox(height: 10),
                    PrayerRow(
                      icon: Icons.nightlight_round,
                      name: 'Isha',
                      time: '08:00 PM',
                      notification: false,
                    ),
                  ],
  ),
),
          ],
        ),
      ),
    );
  }
}