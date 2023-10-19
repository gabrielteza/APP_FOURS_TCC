import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatefulWidget {
  @override
  _TemperatureConverterAppState createState() => _TemperatureConverterAppState();
}

class _TemperatureConverterAppState extends State<TemperatureConverterApp> {
  double celsius = 0.0;

  void convertTemperatures(double celsiusValue) {
    setState(() {
      celsius = celsiusValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Conversor de Temperatura'),
          backgroundColor: const Color.fromARGB(255, 100, 23, 145),
          leading: Icon(Icons.thermostat_auto_outlined),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                child: buildTextField(),
              ),
              SizedBox(height: 20.0),
              buildResultText('Celsius: ${celsius.toStringAsFixed(2)} °C'),
              buildResultText('Kelvin: ${(celsius + 273.15).toStringAsFixed(2)} K'),
              buildResultText('Fahrenheit: ${(celsius * 9 / 5 + 32).toStringAsFixed(2)} °F'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: (value) {
        double input = double.tryParse(value) ?? 0.0;
        convertTemperatures(input);
      },
      decoration: InputDecoration(
        labelText: 'Celsius',
        labelStyle: TextStyle(
          color: Colors.black, 
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget buildResultText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }
}
