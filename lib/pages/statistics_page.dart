import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quitchars/setting_screen.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _timeDisplay = "00 00 00 00";
  final DateTime _startDate = DateTime(2025, 6, 19, 19, 59);

  @override
  void initState() {
    super.initState();
    _startStopWatch();
  }

  void _startStopWatch() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      setState(() {
        _timeDisplay = _formatTime(_stopwatch.elapsedMilliseconds);
      });
    });
  }

  String _formatTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 1000).truncate();
    int hours = (minutes / 1000).truncate();
    int days = (hours / 1000).truncate();

    seconds = seconds % 60;
    minutes = minutes % 60;
    hours = hours % 24;
    days = days % 7;

    return "${days.toString().padLeft(1, '0')} "
        "${hours.toString().padLeft(2, '0')} "
        "${minutes.toString().padLeft(2, '0')} "
        "${seconds.toString().padLeft(2, '0')} ";
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _stopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 98, 5),
        title: Text(
          'Statistics',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
              icon: Icon(Icons.settings, color: Colors.white, size: 34),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 330,
                width: size.width,
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   colors: [
                  //     const Color.fromARGB(255, 165, 209, 246),
                  //     const Color.fromARGB(255, 232, 188, 240),
                  //   ],
                  // ),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image(image: AssetImage('assets/mountains.jpg')),
                    ),
                    SizedBox(height: 10),
                    Row(children: [Column()]),
                    Text(
                      _timeDisplay,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 75, 98, 5),
                        // letterSpacing: 4,
                        wordSpacing: 6,
                        fontFeatures: [FontFeature.tabularFigures()],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Days Hours Min Sec',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                        // letterSpacing: 6,
                        wordSpacing: 12,
                        fontFeatures: [FontFeature.tabularFigures()],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    //           Text(
                    //             "since ${_startDate.day} ${_getMonthName(_startDate.month)} ${_startDate.year}, "
                    //             "${_startDate.hour.toString().padLeft(2, '0')}:"
                    //             "${_startDate.minute.toString().padLeft(2, '0')}",
                    //             style: const TextStyle(fontSize: 16, color: Colors.grey),
                    //           ),
                    Text(
                      "since: ${_startDate.day} ${_getMonthName(_startDate.month)} ${_startDate.year}, "
                      "${_startDate.hour.toString().padLeft(2, '0')}:",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _getMonthName(int month) {
  const months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  return months[month - 1];
}

// import 'package:flutter/material.dart';
// import 'dart:async';

// class StatisticsPage extends StatefulWidget {
//   const StatisticsPage({super.key});

//   @override
//   State<StatisticsPage> createState() => _StatisticsPageState();
// }

// class _StatisticsPageState extends State<StatisticsPage> {
//   final Stopwatch _stopwatch = Stopwatch();
//   late Timer _timer;
//   String _timeDisplay = "00  00  00  00";
//   final DateTime _startDate = DateTime(2025, 6, 19, 19, 59);

//   @override
//   void initState() {
//     super.initState();
//     _startStopwatch();
//   }

//   void _startStopwatch() {
//     _stopwatch.start();
//     _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
//       setState(() {
//         _timeDisplay = _formatTime(_stopwatch.elapsedMilliseconds);
//       });
//     });
//   }

//   String _formatTime(int milliseconds) {
//     int seconds = (milliseconds / 1000).truncate();
//     int minutes = (seconds / 60).truncate();
//     int hours = (minutes / 60).truncate();
//     int days = (hours / 24).truncate();

//     seconds = seconds % 60;
//     minutes = minutes % 60;
//     hours = hours % 24;

//     return "${days.toString().padLeft(2, '0')}  "
//         "${hours.toString().padLeft(2, '0')}  "
//         "${minutes.toString().padLeft(2, '0')}  "
//         "${seconds.toString().padLeft(2, '0')}";
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     _stopwatch.stop();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Time numbers with perfect spacing
//           Text(
//             _timeDisplay,
//             style: const TextStyle(
//               fontSize: 40,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1,
//               fontFeatures: [FontFeature.tabularFigures()],
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 4),
//           // Labels with matching spacing
//           const Text(
//             "Day   Hours   Min   Sec",
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey,
//               letterSpacing: 4,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 24),
//           // Since date
//           Text(
//             "since ${_startDate.day} ${_getMonthName(_startDate.month)} ${_startDate.year}, "
//             "${_startDate.hour.toString().padLeft(2, '0')}:"
//             "${_startDate.minute.toString().padLeft(2, '0')}",
//             style: const TextStyle(fontSize: 16, color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }

//   String _getMonthName(int month) {
//     const months = [
//       "Jan",
//       "Feb",
//       "Mar",
//       "Apr",
//       "May",
//       "Jun",
//       "Jul",
//       "Aug",
//       "Sep",
//       "Oct",
//       "Nov",
//       "Dec",
//     ];
//     return months[month - 1];
//   }
// }
