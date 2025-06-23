import 'package:flutter/material.dart';
import 'package:quitchars/onboarding_screens/parameters_screen.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuitWeedIntroductionState createState() => _QuitWeedIntroductionState();
}

class _QuitWeedIntroductionState extends State<CurrencyScreen> {
  String selectedCurrency = 'USD';
  bool isDropdownOpen = false;

  final List<Map<String, String>> currencies = [
    {'code': 'USD', 'name': 'US Dollar', 'symbol': '\$'},
    {'code': 'EUR', 'name': 'Euro', 'symbol': '€'},
    {'code': 'GBP', 'name': 'British pound', 'symbol': '£'},
    {'code': 'CAD', 'name': 'Canadian dollar', 'symbol': '\$'},
    {'code': 'AUD', 'name': 'Australian dollar', 'symbol': '\$'},
    {'code': 'CZK', 'name': 'Česká koruna', 'symbol': 'Kč'},
    {'code': 'ILS', 'name': 'Israel Shekel', 'symbol': '₪'},
    {'code': 'ZAR', 'name': 'South Africa Rand', 'symbol': 'R'},
    {'code': 'BRL', 'name': 'Brazil Real', 'symbol': 'R\$'},
    {'code': 'BGN', 'name': 'Bulgarian Lev', 'symbol': 'лв'},
    {'code': 'PLN', 'name': 'Poland Zloty', 'symbol': 'zł'},
  ];

  String getCurrencyDisplay(String code) {
    final currency = currencies.firstWhere((c) => c['code'] == code);
    return '${currency['code']} - ${currency['name']} - ${currency['symbol']}';
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: SizedBox(
          width: 200,
          height: 8,
          child: LinearProgressIndicator(
            value: 0.3, // Adjust progress as needed
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(
              Color.fromARGB(255, 75, 98, 5),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
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
                    // vertical: 4.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Select Your\nPreferred currency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isDropdownOpen = !isDropdownOpen;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 75, 98, 5),
                                  width: 2,
                                ),
                                // borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromARGB(255, 75, 98, 5),
                                        width: 2,
                                      ),
                                      color: Color.fromARGB(255, 93, 101, 67),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '\$100',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      getCurrencyDisplay(selectedCurrency),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    isDropdownOpen
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    size: 40,
                                    color: Color.fromARGB(255, 75, 98, 5),
                                  ),
                                  // if (isDropdownOpen) Container(),
                                ],
                              ),
                            ),
                          ),
                          if (isDropdownOpen)
                            Container(
                              constraints: BoxConstraints(maxHeight: 300),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: currencies.length,
                                itemBuilder: (context, index) {
                                  final currency = currencies[index];
                                  bool isSelected =
                                      currency['code'] == selectedCurrency;
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedCurrency = currency['code']!;
                                        isDropdownOpen = false;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            isSelected
                                                ? Color.fromARGB(
                                                  255,
                                                  75,
                                                  98,
                                                  5,
                                                ).withOpacity(0.1)
                                                : Colors.transparent,
                                      ),
                                      child: Text(
                                        getCurrencyDisplay(currency['code']!),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              isSelected
                                                  ? Color.fromARGB(
                                                    255,
                                                    75,
                                                    98,
                                                    5,
                                                  )
                                                  : Colors.black87,
                                          fontWeight:
                                              isSelected
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'The symbol of the selected currency will be used in the app. Also, money achievements will be adjusted based on the relative value of your currency, so make sure you select the correct one (the one you used to buy your marijuana products).',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 300),
                      Container(
                        width: 130,
                        height: 55,
                        margin: const EdgeInsets.only(bottom: 34),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ParametersScreen(),
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
