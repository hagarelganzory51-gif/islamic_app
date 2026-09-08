import 'package:flutter/material.dart';
import 'package:islamic_app/color.dart';

class AzkarWidget extends StatelessWidget {
  const AzkarWidget({
    super.key,
     required this.azkar, 
    
  });
   final String azkar;
  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,),
      decoration: BoxDecoration(
        color: AppColors.prime,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            azkar,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}