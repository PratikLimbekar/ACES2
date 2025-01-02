import 'package:aces/adminHome/bottomNavBar/Page1.dart';
import 'package:aces/adminHome/bottomNavBar/Page2.dart';
import 'package:aces/adminHome/bottomNavBar/Page3.dart';
import 'package:aces/adminHome/bottomNavBar/Page4.dart';
import 'package:flutter/material.dart';
import 'package:aces/constants/colors.dart';

class admin_bottom_nav extends StatefulWidget {
  const admin_bottom_nav({key, required this.title});
  final String title;
  @override
  State<admin_bottom_nav> createState() => _admin_bottom_nav();
}

class _admin_bottom_nav extends State<admin_bottom_nav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    const List<Widget> pages = <Widget>
    [
      Page1(title: "Page1",),
      Page2(title: "Page2",),
      Page3(title: "Page3",),
      Page4(title: "Page4",),
    ];

    return Scaffold(
        body: Center(
          child: pages.elementAt(_selectedIndex),
        ),

        bottomNavigationBar: BottomNavigationBar(
          elevation: 25, //border light dark
          iconSize: 25, //size of icon
          selectedFontSize: 10,

          // this is a code which execute when the items will select
          selectedIconTheme: const IconThemeData(color: AppColors.gray, size: 27),
          selectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, color: AppColors.gray),

          items: const <BottomNavigationBarItem>[
            //first Page
            BottomNavigationBarItem(
              // backgroundColor: Colors.white,
                icon: Icon(Icons.home,color: AppColors.gray,),
                label: 'Home'
            ),

            //Second Page
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note, color: AppColors.gray),
              label: 'Events',
            ),

            //Third Page
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_sharp, color: AppColors.gray),
              label: 'Leader Board',
            ),

            //Fourth Page
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded, color: AppColors.gray),
              label: 'About ACES',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        )
    );
  }
}
