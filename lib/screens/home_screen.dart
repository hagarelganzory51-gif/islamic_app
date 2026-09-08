import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/color.dart';
import 'package:islamic_app/widgets/time_widget.dart';

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

            TimeWidget(),
            
          ],
        ),
      ),
    );
  }
}
