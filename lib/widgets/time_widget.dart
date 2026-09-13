import 'package:flutter/material.dart';
import 'package:islamic_app/color.dart';
import 'package:islamic_app/widgets/payerrow.dart';
import 'package:prayer_times_calculation/prayer_times_calculation.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({
    super.key,
  });

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  late PrayerTimes times;

  @override
  void initState() {
    super.initState();

    const options = CalculationOptions(
      method: CalculationMethod.egypt,
      asrJurisdiction: AsrJurisdiction.standard,
    );

    final prayerTimes = PrayerTimesSDK(
      30.0444,
      31.2357,
      DateTime.now(),
      2.0,
      options,
    );

    times = prayerTimes.getTimes();
  }

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
            time: times.fajr,
            notification: false,
          ),

          const SizedBox(height: 10),

          PrayerRow(
            icon: Icons.wb_sunny,
            name: 'Sunrise',
            time: times.sunrise,
            notification: false,
          ),

          const SizedBox(height: 10),

          PrayerRow(
            icon: Icons.wb_sunny_outlined,
            name: 'Dhuhr',
            time: times.dhuhr,
            notification: false,
          ),

          const SizedBox(height: 10),

          PrayerRow(
            icon: Icons.wb_sunny_outlined,
            name: 'Asr',
            time: times.asr,
            notification: false,
          ),

          const SizedBox(height: 10),

          PrayerRow(
            icon: Icons.wb_sunny_outlined,
            name: 'Maghrib',
            time: times.maghrib,
            notification: false,
          ),

          const SizedBox(height: 10),

          PrayerRow(
            icon: Icons.nightlight_round,
            name: 'Isha',
            time: times.isha,
            notification: false,
          ),
        ],
      ),
    );
  }
}