import 'package:flutter/material.dart';
import 'package:islamic_app/color.dart';
import 'package:islamic_app/widgets/azkar_widget.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

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
          children:[
            Text(
                'Azkar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              AzkarWidget(
                azkar: 'Morning Azkar',
              ),
              SizedBox(height: 20),
               AzkarWidget(
                azkar: 'Evening Azkar',
              ),
          ]
        ),
      )
    );
  }
}
