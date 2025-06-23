import 'package:flutter/material.dart';
import 'package:quitchars/pages/achievements_page.dart';
import 'package:quitchars/pages/health_page.dart';
import 'package:quitchars/pages/info_page.dart';
import 'package:quitchars/pages/statistics_page.dart';
import 'package:quitchars/utils/custom_button_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    StatisticsPage(),
    HealthPage(),
    AchievementsPage(),
    InfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomButtonNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
