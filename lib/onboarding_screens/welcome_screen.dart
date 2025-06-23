import 'package:flutter/material.dart';
import 'package:quitchars/onboarding_screens/currency_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuitWeedIntroductionState createState() => _QuitWeedIntroductionState();
}

class _QuitWeedIntroductionState extends State<WelcomeScreen> {
  bool _showFullIntroduction = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 4.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      SizedBox(
                        height: size.height * 0.2,
                        child: Center(
                          child: Image.asset('assets/quit_weed.jpg'),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Quit Weed',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Congratulations on your decision to Quit Weed! You will be asked about your weed consumption so that the app can create statistics, achievements, and monitor health benefits for you.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showFullIntroduction = !_showFullIntroduction;
                          });
                        },

                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 219, 217, 217),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Introduction (optional long read)',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 75, 98, 5),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    // SizedBox(width: 20),
                                    Icon(
                                      _showFullIntroduction
                                          ? Icons.arrow_downward
                                          : Icons.arrow_forward,
                                      color: Colors.lightGreen[900],
                                    ),
                                  ],
                                ),
                              ),
                              if (_showFullIntroduction)
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        "Cannabis is becoming more and more popular, gaining hundreds of new users every day. Unfortunately, after some time, when they develop tolerance, many people find that it is no longer enjoyable for them, but also that they are unable to give it up and move on. Some may even find out that cannabis has completely consumed their life and is now the only thing they look forward to."
                                        "\n\n"
                                        "The plant that once made them feel happy, creative, and friendly is now making them sad, unmotivated, anxious, depressed, and desperate... Wanting to get high when they are not, and wanting to be sober when they are high. This drug is not for everyone, and the fact that you downloaded this app shows that you are very likely one of us - weed addicts."
                                        "\n\n"
                                        "Firstly, treat it for what it is, a drug addiction. Not a habit. It is a drug addiction, and you are likely a drug addict. It may sound harsh, but it is true. And I am not saying it to bring you down, but to help you. I personally know how it feels. I have been there.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          height: 1.7,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(16.0),
                                      padding: EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF8B4513),
                                            Color(0xFFCD835F),
                                            Color(0xFFD26913),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          16.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.3,
                                            ),
                                            blurRadius: 10,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.format_quote,
                                            size: 60,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Text(
                                                "Marijuana use becomes an addiction when the person can't stop using the drug even though it interferes with many aspects of his or her life.",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.4,
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Text(
                                        "    - One study estimated that approximately 3 in 10 people who use marijuana have marijuana use disorder. [source]"
                                        "\n\n"
                                        "    - Another study estimated that people who use cannabis have about a 10% likelihood of becoming addicted. [source]"
                                        "\n\n"
                                        "    - The risk of developing marijuana use disorder is greater in people who start using marijuana during youth or adolescence and who use marijuana more frequently. [source]"
                                        "\n\n"
                                        """Personally, I think these numbers will rise even higher as weed is becoming more and more potent, now to an extreme extent. Just look at the image below of how weed looked back then - these were the top strains in 1977. A lot of data on weed is outdated because of how much stronger it has become. You may have heard a lot of those "weed is not addictive" claims, which may have been true in the past, but the evidence suggests it is no longer the case.""",
                                        style: TextStyle(
                                          fontSize: 16,
                                          height: 1.7,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Image.asset('assets/weed.jpg'),
                                            SizedBox(height: 10),
                                            Text(
                                              'High Times magazine, TOP Buds of The Year, 1977',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 200),
                      Container(
                        width: 130,
                        height: 55,
                        margin: const EdgeInsets.only(bottom: 34),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CurrencyScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 75, 98, 5),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                            elevation: 0,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, size: 20),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
