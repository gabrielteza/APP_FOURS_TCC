import 'package:flutter/material.dart';

void main() {
  runApp(AreaPage());
}

class AreaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Area Calculator App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Area Calculator'),
          backgroundColor: Color.fromARGB(255, 100, 23, 145),
          leading: Icon(Icons.square_foot),
        ),
        body: AreaCalculator(),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class AreaCalculator extends StatefulWidget {
  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  final List<String> shapes = ['Retângulo', 'Triângulo', 'Quadrado'];
  String currentShape = 'Retângulo';
  String result = 'Área: 0';
  double width = 0;
  double height = 0;

  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widthController.addListener(updateWidth);
    heightController.addListener(updateHeight);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.1 * screenWidth),
            child: DropdownButton<String>(
              value: currentShape,
              items: shapes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 0.05 * screenWidth,
                      color: currentShape == value ? Colors.purple : Colors.black,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (shape) {
                setState(() {
                  currentShape = shape ?? 'Retângulo';
                });
              },
            ),
          ),
          AreaTextField(widthController, 'Base', screenWidth),
          AreaTextField(heightController, 'Altura', screenWidth),
          Container(
            margin: EdgeInsets.all(0.05 * screenWidth),
            child: ElevatedButton(
              child: Text(
                'Calcular',
                style: TextStyle(
                  fontSize: 0.05 * screenWidth,
                ),
              ),
              onPressed: calculateArea,
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 100, 23, 145),
              ),
            ),
          ),
          Text(
            result,
            style: TextStyle(
              fontSize: 0.05 * screenWidth,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void calculateArea() {
    double area;

    if (currentShape == 'Retângulo') {
      area = width * height;
    } else if (currentShape == 'Triângulo') {
      area = width * height / 2;
    } else if (currentShape == 'Quadrado') {
      area = width * width;
    } else {
      area = 0;
    }
    setState(() {
      result = 'Área: $area';
    });
  }

  void updateWidth() {
    setState(() {
      width = double.tryParse(widthController.text) ?? 0;
    });
  }

  void updateHeight() {
    setState(() {
      height = double.tryParse(heightController.text) ?? 0;
    });
  }
}

class AreaTextField extends StatelessWidget {
  AreaTextField(this.controller, this.hint, this.screenWidth);

  final TextEditingController controller;
  final String hint;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.05 * screenWidth),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 0.05 * screenWidth,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.border_all),
          filled: true,
          fillColor: Colors.grey[300],
          hintText: hint,
        ),
      ),
    );
  }
}


