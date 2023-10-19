import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculadora de Massa',
    home: MassaCalculator(),
  ));
}

class MassaCalculator extends StatefulWidget {
  @override
  _MassaCalculatorState createState() => _MassaCalculatorState();
}

class _MassaCalculatorState extends State<MassaCalculator> {
  double densidade = 0.0;
  double volume = 0.0;
  double massa = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Massa'),
        backgroundColor: Color.fromARGB(255, 100, 23, 145),
        leading: Icon(Icons.balance_sharp),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  child: TextField(
                    onChanged: (value) {
               setState(() {
                  densidade = double.tryParse(value) ?? 0.0;
                });
              },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Densidade (kg/m³)',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
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
                    onChanged: (value) {
                setState(() {
                  volume = double.tryParse(value) ?? 0.0;
                });
              },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'volume (m³)',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                backgroundColor:Color.fromARGB(255, 100, 23, 145),
                minimumSize: Size(180, 30),
              ),
              onPressed: () {
                setState(() {
                  massa = densidade * volume;
                });
              },
              child: Text('Calcular Massa'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Massa: $massa kg',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
