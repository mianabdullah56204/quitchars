import 'package:flutter/material.dart';
import 'package:quitchars/onboarding_screens/date_screen.dart';

class ParametersScreen extends StatefulWidget {
  const ParametersScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuitWeedIntroductionState createState() => _QuitWeedIntroductionState();
}

class _QuitWeedIntroductionState extends State<ParametersScreen> {
  String selectedParameters = 'Joints';
  String? _selectedScaleUnit = 'gram';
  bool isDropdownOpen = false;

  final TextEditingController frequency1Controller = TextEditingController();
  final TextEditingController frequency2Controller = TextEditingController();
  final TextEditingController moneyController = TextEditingController();

  final List<Map<String, String>> usage = [
    {'weed': 'Joints'},
    {'weed': 'Bong rips'},
    {'weed': 'Edibles'},
    {'weed': 'Bowls'},
    {'weed': 'Vaping sessions'},
    {'weed': 'Dabs'},
    {'weed': 'Blunts'},
    {'weed': 'Capsules'},
  ];

  String getParametersDisplay(String code) {
    final parameters = usage.firstWhere((c) => c['weed'] == code);
    return '${parameters['weed']}';
  }

  final List<String> _scaleUnits = ['gram', 'ounce', 'milligram', 'milliliter'];

  Map<String, String> getDynamicLabels() {
    switch (_selectedScaleUnit) {
      case 'gram':
        return {
          'frequency1': '$selectedParameters per day',
          'frequency2':
              'Grams per ${selectedParameters.toLowerCase().replaceAll('s', '')}',
          'cost': 'Cost per Grams (\$)',
        };
      case 'ounce':
        return {
          'frequency1': '$selectedParameters per day',
          'frequency2':
              'Ounce per ${selectedParameters.toLowerCase().replaceAll('s', '')}',
          'cost': 'Cost per ounce (\$)',
        };
      case 'milligram':
        return {
          'frequency1': '$selectedParameters per day',
          'frequency2':
              'Milligrams per ${selectedParameters.toLowerCase().replaceAll('s', '')}',
          'cost': 'Cost per Milligram (\$)',
        };
      case 'milliliter':
        return {
          'frequency1': '$selectedParameters per day',
          'frequency2':
              'Milliliters per ${selectedParameters.toLowerCase().replaceAll('s', '')}',
          'cost': 'Cost per Milliliter (\$)',
        };
    }
    return {
      'frequency1': '$selectedParameters per day',
      'frequency2':
          'Grams per ${selectedParameters.toLowerCase().replaceAll('s', '')}',
      'cost': 'Cost per Grams (\$)',
    };
  }

  void _showEmptyFieldsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Please enter valid numbers.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'One or more of your usage parameters were filled in incorrectly. Please check the number format and try again. The numbers can be decimal and must be greater than zero.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 75, 98, 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'ok',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 75, 98, 5),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleNextButton() {
    if (frequency1Controller.text.trim().isEmpty ||
        frequency2Controller.text.trim().isEmpty ||
        moneyController.text.trim().isEmpty) {
      _showEmptyFieldsDialog();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DateScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> lables = getDynamicLabels();
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
            value: 0.7, // Adjust progress as needed
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
                    vertical: 4.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Please enter your weed usage parameters',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            'Preferred Scale Unit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        // spacing: 12,
                        children: [
                          ..._scaleUnits.map((unit) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<String>(
                                  value: unit,
                                  groupValue: _selectedScaleUnit,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedScaleUnit = value;
                                    });
                                  },
                                  activeColor: Color.fromARGB(255, 75, 98, 5),
                                ),
                                Text(unit),
                              ],
                            );
                          }),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            'Main Usage Method',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
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
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(255, 75, 98, 5),
                                      width: 2,
                                    ),
                                  ),
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        getParametersDisplay(
                                          selectedParameters,
                                        ),
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
                                  ],
                                ),
                              ),
                            ),
                            if (isDropdownOpen)
                              Container(
                                constraints: BoxConstraints(maxHeight: 300),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withAlpha(400),
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: usage.length,
                                  itemBuilder: (context, index) {
                                    final parameters = usage[index];
                                    bool isSelected =
                                        parameters['weed'] ==
                                        selectedParameters;
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedParameters =
                                              parameters['weed']!;
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
                                          getParametersDisplay(
                                            parameters['weed']!,
                                          ),
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
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            'Usage Frequency',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: frequency1Controller,
                                  cursorColor: Color.fromARGB(255, 75, 98, 5),
                                  decoration: InputDecoration(
                                    labelText: lables['frequency1'],
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 75, 98, 5),
                                        width: 2.0,
                                      ),
                                    ),
                                    floatingLabelStyle: TextStyle(
                                      color: Color.fromARGB(255, 75, 98, 5),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: frequency2Controller,
                                  cursorColor: Color.fromARGB(255, 75, 98, 5),
                                  decoration: InputDecoration(
                                    labelText: lables['frequency2'],
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 75, 98, 5),
                                        width: 2.0,
                                      ),
                                    ),
                                    floatingLabelStyle: TextStyle(
                                      color: Color.fromARGB(255, 75, 98, 5),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Money',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: moneyController,
                              cursorColor: Color.fromARGB(255, 75, 98, 5),
                              decoration: InputDecoration(
                                labelText: lables['cost'],
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 75, 98, 5),
                                    width: 2.0,
                                  ),
                                ),
                                floatingLabelStyle: TextStyle(
                                  color: Color.fromARGB(255, 75, 98, 5),
                                ),
                                labelStyle: TextStyle(color: Colors.grey[800]),
                              ),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 130,
                            height: 55,
                            margin: const EdgeInsets.only(bottom: 34),
                            child: ElevatedButton(
                              onPressed: _handleNextButton,
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
