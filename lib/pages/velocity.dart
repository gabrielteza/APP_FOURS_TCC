import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpeedConverter(),
    );
  }
}

class SpeedConverter extends StatefulWidget {
  @override
  _SpeedConverterState createState() => _SpeedConverterState();
}

class _SpeedConverterState extends State<SpeedConverter> {
  double mpsValue = 0.0;
  double kmhValue = 0.0;

  TextEditingController mpsController = TextEditingController();
  TextEditingController kmhController = TextEditingController();

  void convertToKmh(double mps) {
    setState(() {
      kmhValue = mps * 3.6;
      kmhController.text = kmhValue.toStringAsFixed(2);
    });
  }

  void convertToMps(double kmh) {
    setState(() {
      mpsValue = kmh / 3.6;
      mpsController.text = mpsValue.toStringAsFixed(2);
    });
  }

  void onConvertButtonPressed() {
    if (mpsController.text.isNotEmpty) {
      double mps = double.parse(mpsController.text);
      convertToKmh(mps);
    } else if (kmhController.text.isNotEmpty) {
      double kmh = double.parse(kmhController.text);
      convertToMps(kmh);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Conversor de Velocidade'),
        backgroundColor: Color.fromARGB(255, 100, 23, 145),
        leading: Icon(Icons.speed),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.05 * screenWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 0.1 * screenWidth),
            Container(
              margin: EdgeInsets.all(0.02 * screenWidth),
              padding: EdgeInsets.all(0.02 * screenWidth),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(0.04 * screenWidth),
              ),
              child: TextField(
                controller: mpsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'm/s',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 0.04 * screenWidth),
                ),
                style: TextStyle(fontSize: 0.04 * screenWidth),
              ),
            ),
            SizedBox(height: 0.02 * screenWidth),
            Container(
              margin: EdgeInsets.all(0.02 * screenWidth),
              padding: EdgeInsets.all(0.02 * screenWidth),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(0.04 * screenWidth),
              ),
              child: TextField(
                controller: kmhController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'km/h',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 0.04 * screenWidth),
                ),
                style: TextStyle(fontSize: 0.04 * screenWidth),
              ),
            ),
            SizedBox(height: 0.02 * screenWidth),
            ElevatedButton(
              onPressed: onConvertButtonPressed,
              child: Text('Calcular', style: TextStyle(fontSize: 0.05 * screenWidth)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 100, 23, 145),
                minimumSize: Size(140, 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

