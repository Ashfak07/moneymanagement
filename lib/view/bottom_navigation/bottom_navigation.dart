import 'package:flutter/material.dart';
import 'package:moneymanagement/view/expencescreen/expence_screen.dart';
import 'package:moneymanagement/view/homescreen/home_screen.dart';
import 'package:moneymanagement/view/incomescreen/income_screen.dart';
import 'package:moneymanagement/view/overviewscreen/overview_screen.dart';
import 'package:moneymanagement/view/settingsscreen/settings_screen.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentindex = 0;
  final pages = [
    HomeScreen(),
    IncomeScreen(),
    ExpenceScreen(),
    OverViewScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentindex,
          onTap: (newstate) {
            setState(() {
              currentindex = newstate;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.money_outlined), label: 'Income'),
            BottomNavigationBarItem(
                icon: Icon(Icons.money_off), label: 'Expence'),
            BottomNavigationBarItem(
                icon: Icon(Icons.analytics_outlined), label: 'Overview'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
      body: pages[currentindex],
    );
  }
}
