import 'package:flutter/material.dart';
import 'package:islamic_app/color.dart';
import 'package:islamic_app/widgets/payerrow.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 40,
      ),
      decoration: BoxDecoration(
        color: AppColors.prime,
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
    );
  }
}