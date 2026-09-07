
import 'package:flutter/material.dart';

class PrayerRow extends StatefulWidget {
  final IconData icon;
  final String name;
  final String time;
  final bool notification;

  const PrayerRow({
    super.key,
    required this.icon,
    required this.name,
    required this.time,
    required this.notification,
  });

  @override
  State<PrayerRow> createState() => _PrayerRowState();
}

class _PrayerRowState extends State<PrayerRow> {
  late bool isNotificationOn;

  @override
  void initState() {
    super.initState();
    isNotificationOn = widget.notification;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          color: Colors.amber,
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            widget.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),

        Text(
          widget.time,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),

        Switch(
          value: isNotificationOn,
          onChanged: (value) {
            setState(() {
              isNotificationOn = value;
            });
          },
        ),
      ],
    );
  }
}

