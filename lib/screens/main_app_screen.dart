import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamic_app/color.dart';
import 'package:islamic_app/screens/azkar_screen.dart';
import 'package:islamic_app/screens/home_screen.dart';
import 'package:islamic_app/screens/quran_screen.dart';
import 'package:islamic_app/screens/tasbih_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentindex = 0;

  List<Widget> screen = [
    HomeScreen(),
    AzkarScreen(),
    QuranScreen(),
    TasbihScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        index: currentindex,
        children: screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.prime,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.black,
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items:  [
           BottomNavigationBarItem(
              icon: Icon(Icons.home,color: AppColors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:SvgPicture.asset('assets/icons/ic_hadeth.svg'),
            label: 'Azkar' ,
          ),
          BottomNavigationBarItem(
            icon:SvgPicture.asset('assets/icons/ic_quran.svg'),
            label:  'Quran',
          ),
           BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/ic_sebha.svg'),
            label:  'Tasbih',
          ),
          
        ],
      )
    );
  }
}