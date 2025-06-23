import 'package:flutter/material.dart';
import 'package:quitchars/onboarding_screens/currency_screen.dart';
import 'package:quitchars/onboarding_screens/date_screen.dart';
import 'package:quitchars/onboarding_screens/parameters_screen.dart';
import 'package:quitchars/onboarding_screens/welcome_screen.dart';
import 'package:quitchars/pages/info_page.dart';
import 'package:quitchars/screens.dart/notifications_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 98, 5),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                'Usage Paramerters',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: size.width,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(40),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(4, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        // top: 16,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Color.fromARGB(255, 75, 98, 5),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'App Introduction',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 75, 98, 5),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CurrencyScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        top: 6,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: Color.fromARGB(255, 75, 98, 5),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Change Currency',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 75, 98, 5),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ParametersScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        top: 6,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.analytics_outlined,
                                color: Color.fromARGB(255, 75, 98, 5),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Weed Consumption & Cost',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 75, 98, 5),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DateScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        top: 6,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.edit_calendar_outlined,
                                color: Color.fromARGB(255, 75, 98, 5),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Adjust Quit Date',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 75, 98, 5),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        top: 6,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.restart_alt,
                                color: Color.fromARGB(255, 75, 98, 5),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'RESTART Quits',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 75, 98, 5),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 14),
              child: Text(
                'Customization',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 14),
            Container(
              width: size.width,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(40),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(4, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.notifications_outlined,
                                color: Color.fromARGB(255, 75, 98, 5),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Notifications',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 75, 98, 5),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye,
                                color: Color.fromARGB(255, 75, 98, 5),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Replace Triggering Icons',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 75, 98, 5),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 14),
              child: Text(
                'PRO Version',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 14),
            Container(
              width: size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(40),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(4, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InfoPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.diamond,
                                color: Color.fromARGB(255, 75, 98, 5),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Upgrade Quit Weed',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 75, 98, 5),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
