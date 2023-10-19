import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimeConverter(),
    );
  }
}

class TimeConverter extends StatefulWidget {
  @override
  _TimeConverterState createState() => _TimeConverterState();
}

class _TimeConverterState extends State<TimeConverter> {
  double hoursValue = 0.0;
  double minutesValue = 0.0;
  double secondsValue = 0.0;

  TextEditingController hoursController = TextEditingController();
  TextEditingController minutesController = TextEditingController();
  TextEditingController secondsController = TextEditingController();

  void convertToMinutes(double hours) {
    setState(() {
      minutesValue = hours * 60;
      minutesController.text = minutesValue.toStringAsFixed(2);
    });
  }

  void convertToSeconds(double hours) {
    setState(() {
      secondsValue = hours * 3600;
      secondsController.text = secondsValue.toStringAsFixed(2);
    });
  }

  void onConvertButtonPressed() {
    if (hoursController.text.isNotEmpty) {
      double hours = double.parse(hoursController.text);
      convertToMinutes(hours);
      convertToSeconds(hours);
    } else if (minutesController.text.isNotEmpty) {
      double minutes = double.parse(minutesController.text);
      hoursController.text = (minutes / 60).toStringAsFixed(2);
      convertToSeconds(minutes / 60);
    } else if (secondsController.text.isNotEmpty) {
      double seconds = double.parse(secondsController.text);
      hoursController.text = (seconds / 3600).toStringAsFixed(2);
      minutesController.text = ((seconds % 3600) / 60).toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Conversor de Tempo'),
        backgroundColor: Color.fromARGB(255, 100, 23, 145),
        leading: Icon(Icons.watch_later_outlined),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.05 * screenWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(0.02 * screenWidth),
              padding: EdgeInsets.all(0.02 * screenWidth),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(0.02 * screenWidth),
              ),
              child: TextField(
                controller: hoursController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Horas',
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
                borderRadius: BorderRadius.circular(0.02 * screenWidth),
              ),
              child: TextField(
                controller: minutesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Minutos',
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
                borderRadius: BorderRadius.circular(0.02 * screenWidth),
              ),
              child: TextField(
                controller: secondsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Segundos',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 0.04 * screenWidth),
                ),
                style: TextStyle(fontSize: 0.04 * screenWidth),
              ),
            ),
            SizedBox(height: 0.02 * screenWidth),
               ElevatedButton(
                  onPressed: onConvertButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 100, 23, 145),
                    minimumSize: Size(180, 60),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(13.0),
                    child: Center(
                      child: Text(
                        'Calcular', style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
            /*ElevatedButton(
              onPressed: onConvertButtonPressed,
              child: Text(
                'Converter',
                style: TextStyle(fontSize: 0.04 * screenWidth),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 100, 23, 145),
                minimumSize: Size(0.2 * screenWidth, 0.05 * screenWidth),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
