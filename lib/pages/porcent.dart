import 'package:flutter/material.dart';

void main() {
  runApp(PercentageCalculatorApp());
}

class PercentageCalculatorApp extends StatefulWidget {
  @override
  _PercentageCalculatorAppState createState() => _PercentageCalculatorAppState();
}

class _PercentageCalculatorAppState extends State<PercentageCalculatorApp> {
  TextEditingController valueController = TextEditingController();
  TextEditingController percentageController = TextEditingController();

  double calculatedPercentage = 0.0;

  void calculatePercentage() {
    double value = double.tryParse(valueController.text) ?? 0.0;
    double percentage = double.tryParse(percentageController.text) ?? 0.0;

    double result = (percentage / 100) * value;

    setState(() {
      calculatedPercentage = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de Porcentagem'),
          backgroundColor: const Color.fromARGB(255, 100, 23, 145),
          leading: Icon(Icons.percent_outlined),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.all(4.0),
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: valueController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Valor',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.all(4.0),
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: percentageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Porcentagem',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: calculatePercentage,
                  child: Text('Calcular', style: TextStyle(fontSize: 20.0)
                  ),
                  style: ElevatedButton.styleFrom(
                    
                    primary: Colors.purple,
                    backgroundColor:Color.fromARGB(255, 100, 23, 145),
                    minimumSize: Size(180, 30),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Resultado: $calculatedPercentage',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
